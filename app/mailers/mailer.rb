class Mailer < ActionMailer::Base
  default from: "econoreply@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail(to: @user.email, subject: '欢迎使用ecoit系统！')
  end
end
