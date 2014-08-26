require 'active_support/concern'

# Notifiable: Create a notification for the user of the parent object. For example
# after a post has been commented on created a notification for the author of that post.
#
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
        notifiable_type: parent_type,
        notifiable_id: parent_id
      )
    end
  end
end
