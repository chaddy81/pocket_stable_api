class API::PaymentsController < ApplicationController
  before_filter :authenticate!

  respond_to :json

  def default_serializer_options
    {root: 'payments'}
  end

  def index
    respond_with Payment.where(user_id: @user.id)
  end

  def show
    respond_with @user.payment
  end

  def update
    puts payment_params
    if @user.payment.update_attributes(payment_params)

      cost = payment_params[:cost].to_i * 100

      if @user.cus_id
        create_stripe_charge(cost, @user.cus_id)
      else
        customer = create_stripe_user(payment_params[:stripe_token], @user.email)
        @user.update_column(:cus_id, customer.id)

        create_stripe_charge(cost, customer.id)
      end
      render json: @user.payment.to_json, status: :ok
    else
      respond_with status: 422
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:cost, :temp_cost, :charge_interval, :total_horses, :stripe_token, :card_last4)
  end

  def create_stripe_user card, email
    CreditCardService.new({
          card: card,
          email: email,
        }).create_customer
  end

  def create_stripe_charge cost, cus_id
    CreditCardService.new({
          amount: cost,
          cus_id: cus_id
        }).create_charge
  end
end
