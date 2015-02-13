class ChargesController < ApplicationController
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

  respond_to do |format|
       if @event.make_premium
         format.html { redirect_to @event, :notice => 'Event was successfully upgraded.' }
       else
         // handle error and redirect
       end
    end

  @user[:charge] == 1

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to root_path
end
end
