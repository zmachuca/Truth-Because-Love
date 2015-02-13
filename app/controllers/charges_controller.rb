class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :update]

	def new
end

def create

  @event.update_attributes(charge: true)
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
  redirect_to root_path
end
end
