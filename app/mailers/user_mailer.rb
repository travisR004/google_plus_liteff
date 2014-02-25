class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user)
    @user = user
    @url = "http://localhost:3000/reset/edit?reset_token=#{@user.reset_reset_token!}"
    mail(to: user.email, subject: "Reset Password")
  end


end
