require 'active_support/concern'

module Notifiable
  extend ActiveSupport::Concern

  included do
    has_one :notification, foreign_key: 'sender_id'

    after_create :notify

    private

    def notify
      klass = parent_type.constantize
      resource = klass.find(parent_id)

      Notification.create(
        message: klass::NOTIFICATION_MESSAGE,
        recipient_id: resource.user_id,
        sender_type: parent_type,
        sender_id: id
      )
    end
  end
end
