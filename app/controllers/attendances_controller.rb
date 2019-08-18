class AttendancesController < ApplicationController
  before_action :set_event
	before_action :redirect_to_root, if: :not_admin?, only: [:index]
  
  def index
  end

  def show
  end

  def new
  end

  def create
    def new
    end
    
    def create
      # Amount in cents
      @amount = 500
    
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end

    def not_admin?
      return @event.admin != current_user
    end

    def redirect_to_root
      redirect_to events_path
    end

  def edit
  end

  def update
  end

  def destroy
  end

end
