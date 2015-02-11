class ChargesController < ApplicationController
	def new
end

def create
  # Amount in cents
  @amount = 999

  customer = Stripe::Customer.create(
    :email => 'example@stripe.com',
    :card  => params[:stripeToken]
    :metadata => {
    :first_name => '', # not if company
    :last_name => '', # not if company
    :contact_person => '',
    :street_line_1 => '123 Carenden Road',
    :street_line_2 => '',
    :city => 'London',
    :postal_code => 'EC5M 8AJ',
    :region => 'London',
    :country => 'GB', # code ISO 3166-1 alpha-2
    :tax_id => '123456789'
  } # all metadata are optional
)
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
