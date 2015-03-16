class Notifications < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_user.subject
  #
  def new_user(user)
    @greeting = "Hello"
    @name = user.name
    @email = user.email

    mail to: @email
  end
end
