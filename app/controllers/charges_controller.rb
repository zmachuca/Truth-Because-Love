class ChargesController < ApplicationController
	def new
end

def create

  @user.update_attributes(charge: true)
  # Amount in cents
  @amount = 999

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

  @user[:charge] == 1

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
