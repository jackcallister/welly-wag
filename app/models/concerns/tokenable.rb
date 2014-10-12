require 'active_support/concern'

# Tokenable: allows for a model to be serialised and
# deserialised using ActiveSupport::MessageVerifier
module Tokenable
  extend ActiveSupport::Concern

  def access_token
    unless persisted?
      raise RecordNotPersistedError,
        "#{self.class} must be saved before generating an access token"
    end

    self.class.verifier.generate(id)
  end

  module ClassMethods
    def find_by_access_token(signature)
      id = verifier.verify(signature)
      self.find(id)

      rescue ActiveSupport::MessageVerifier::InvalidSignature
      nil
    end

    def verifier
      ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
    end
  end

  class RecordNotPersistedError < StandardError; end
end
