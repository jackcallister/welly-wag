require 'active_support/concern'

module Notifiable
  extend ActiveSupport::Concern

  module ClassMethods
    def clear_notifications!(resource, action)
      after_action only: action do
        instance_variable_get("@#{resource}").notifications.each do |notification|
          notification.delete if notification.recipient == current_user
        end
      end
    end
  end
end
