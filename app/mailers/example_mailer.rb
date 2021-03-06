class ExampleMailer < ActionMailer::Base

  def purchase_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to 		 => @user.email,
                      :subject => 'Yo! Your order is being processed!',
                      :text    => 'This is your receipt from www.TruthBecauseLove.com',
                      :html    => "<h1>Here is a review of your order...</h1>
															    <p><strong>Victim's Name:</strong> 				#{@user.name}</p>
															    <p><strong>Address Line:</strong> 				#{@user.address}</p>
															    <p><strong>City:</strong> 								#{@user.city}</p>
															    <p><strong>State:</strong> 								#{@user.state}</p>
															    <p><strong>Zip Code:</strong> 						#{@user.zip}</p>
															    <p><strong>Country:</strong> 							#{@user.country}</p>
															    <p><strong>Letter Design Number:</strong> #{@user.design}</p>
															    <p><strong>YOUR Email:</strong> 					#{@user.email}</p>
															    <span><h2>You delivery will be completed shortly!</h2></span>
															    <p>If you want to make our lives harder contact: TruthBecauseLove@gmail.com</p>" }
    mg_client.send_message ENV['domain'], message_params
  end

  def sale_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => ENV['gmail_username'],
                      :subject => 'BOOM! Someone made a purchase!',
                      :text    => 'This is their receipt from www.TruthBecauseLove.com',
                      :html    => "<h1>Here is a review of their order...</h1>
                                  <p><strong>Victim's Name:</strong>        #{@user.name}</p>
                                  <p><strong>Address Line:</strong>         #{@user.address}</p>
                                  <p><strong>City:</strong>                 #{@user.city}</p>
                                  <p><strong>State:</strong>                #{@user.state}</p>
                                  <p><strong>Zip Code:</strong>             #{@user.zip}</p>
                                  <p><strong>Country:</strong>              #{@user.country}</p>
                                  <p><strong>Letter Design Number:</strong> #{@user.design}</p>
                                  <p><strong>YOUR Email:</strong>           #{@user.email}</p>
                                  <span><h2>Get to work!</h2></span>
                                  <p>...I said get to work.</p>" }
    mg_client.send_message ENV['domain'], message_params
  end

  def Stripe_error_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => ENV['gmail_username'],
                      :subject => 'STRIPE ERROR MESSAGE!',
                      :text    => 'This is their receipt from www.TruthBecauseLove.com',
                      :html    => "<h1>Here is a review of their order...</h1>
                                  <p><strong>Victim's Name:</strong>        #{@user.name}</p>
                                  <p><strong>Address Line:</strong>         #{@user.address}</p>
                                  <p><strong>City:</strong>                 #{@user.city}</p>
                                  <p><strong>State:</strong>                #{@user.state}</p>
                                  <p><strong>Zip Code:</strong>             #{@user.zip}</p>
                                  <p><strong>Country:</strong>              #{@user.country}</p>
                                  <p><strong>Letter Design Number:</strong> #{@user.design}</p>
                                  <p><strong>YOUR Email:</strong>           #{@user.email}</p>
                                  <span><h2>Get to work!</h2></span>
                                  <p>...I said get to work.</p>" }
    mg_client.send_message ENV['domain'], message_params
  end

  def API_error_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => ENV['gmail_username'],
                      :subject => 'API ERROR MESSAGE!',
                      :text    => 'This is their receipt from www.TruthBecauseLove.com',
                      :html    => "<h1>Here is a review of their order...</h1>
                                  <p><strong>Victim's Name:</strong>        #{@user.name}</p>
                                  <p><strong>Address Line:</strong>         #{@user.address}</p>
                                  <p><strong>City:</strong>                 #{@user.city}</p>
                                  <p><strong>State:</strong>                #{@user.state}</p>
                                  <p><strong>Zip Code:</strong>             #{@user.zip}</p>
                                  <p><strong>Country:</strong>              #{@user.country}</p>
                                  <p><strong>Letter Design Number:</strong> #{@user.design}</p>
                                  <p><strong>YOUR Email:</strong>           #{@user.email}</p>
                                  <span><h2>Get to work!</h2></span>
                                  <p>...I said get to work.</p>" }
    mg_client.send_message ENV['domain'], message_params
  end

  def NotStripe_error_email(user)
    @user = user
    mg_client = Mailgun::Client.new ENV['api_key']
    message_params = {:from    => ENV['gmail_username'],
                      :to      => ENV['gmail_username'],
                      :subject => 'NOTSTRIPE ERROR MESSAGE!',
                      :text    => 'This is their receipt from www.TruthBecauseLove.com',
                      :html    => "<h1>Here is a review of their order...</h1>
                                  <p><strong>Victim's Name:</strong>        #{@user.name}</p>
                                  <p><strong>Address Line:</strong>         #{@user.address}</p>
                                  <p><strong>City:</strong>                 #{@user.city}</p>
                                  <p><strong>State:</strong>                #{@user.state}</p>
                                  <p><strong>Zip Code:</strong>             #{@user.zip}</p>
                                  <p><strong>Country:</strong>              #{@user.country}</p>
                                  <p><strong>Letter Design Number:</strong> #{@user.design}</p>
                                  <p><strong>YOUR Email:</strong>           #{@user.email}</p>
                                  <span><h2>Get to work!</h2></span>
                                  <p>...I said get to work.</p>" }
    mg_client.send_message ENV['domain'], message_params
  end
end