class Notification < ActiveRecord::Base
  belongs_to :sender, polymorphic: true
  belongs_to :recipient, class_name: 'User'
end
