module NotificationsHelper

  def notification_badge(notifications)
    render 'notifications/badge', notifications: notifications if notifications.count > 0
  end
end
