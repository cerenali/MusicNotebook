# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/new_user
  def new_user
    Notifications.new_user
  end

end
