class Notification < ActiveRecord::Base
  belongs_to :notifiable, polymorphic: true
  belongs_to :recipient, class_name: 'User'
end
