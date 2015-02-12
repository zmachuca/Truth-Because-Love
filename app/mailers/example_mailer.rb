class ExampleMailer < ActionMailer::Base

  def sample_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['pubkey-7fdfb4370ba447932aad9fbdd0b48a06']
    message_params = {:from    => ENV['zachmachuca@gmail.com'],
                      :to      => @user.email,
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message ENV['truthbecauselove.com'], message_params
  end
end