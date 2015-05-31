class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :update]

	def new
end

def create

  # Amount in cents
  @amount = 699

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe Customer - TruthBecauseLove.com',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end

  def index
end
end
