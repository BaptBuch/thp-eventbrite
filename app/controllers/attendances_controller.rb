class AttendancesController < ApplicationController

  def new
    @user = current_user
    @event = Event.find(params[:event_id])
    @amount = @event.price
    @stripe_amount = (@amount * 100).to_i
  end

  def create
    # Amount in cents
    @user = current_user
    @event = Event.find(params[:event_id])
    @amount = @event.price
    @stripe_amount = (@amount * 100).to_i
    stripe_customer_id = @user.id
  
    begin
      customer = Stripe::Customer.create({email:params[:stripeEmail],source:params[:stripeToken],})
    
      charge = Stripe::Charge.create({customer:customer.id,amount:@stripe_amount,description: 'Paiement en cours',currency: 'eur',})
  
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_attendance_path
    end

    Attendance.create(user: current_user, event: @event, stripe_customer_id: customer.id) if charge.paid

  end 

  def index
    @attendances = []
      Attendance.all.each do |attendance|
        @attendances << attendance
      end
  end

  def show
    @event = Event.find(params[:event_id])
    @attendees = []
    @a = @event.users
    @a.each do |user|
      @attendees << user
    end
    
  end

end
