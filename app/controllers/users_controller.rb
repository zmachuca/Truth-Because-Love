class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      ExampleMailer.purchase_email(@user).deliver
      ExampleMailer.sale_email(@user).deliver
    begin
 
  Rails.logger.error("STRIPE API KEY: #{Stripe.api_key.inspect}")
    @amount = 999
 
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
  redirect_to root_path, notice: "Your Purchase Was Successful! You should recieve an email shortly."
  rescue Stripe::StripeError => e
    ExampleMailer.Stripe_error_email(@user).deliver
    flash[:error] = e.message
    redirect_to charges_path
  rescue Stripe::APIConnectionError => e
    ExampleMailer.API_error_email(@user).deliver
    flash[:error] = e.message
    redirect_to charges_path
  rescue => e
    ExampleMailer.NotStripe_error_email(@user).deliver
  end
     else
      render action: "new"
    end
end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      ExampleMailer.purchase_email(@user).deliver
      ExampleMailer.sale_email(@user).deliver
      redirect_to root_path, notice: "Your Purchase Was Successful! You should recieve an email shortly."
    else
      render action: "new"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :address, :city, :state, :zip, :country, :design)
    end
end
