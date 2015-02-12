class ExampleMailer < ActionMailer::Base
  default from: "zachmachuca@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email', :from => "zachmachuca@gmail.com")
  end
end