class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    @event.start_date = params[:start_date]
    @event.duration = ((params[:duration].to_i) * 5)
    @event.title = params[:title]
    @event.description = params[:description]
    @event.price = params[:price]
    @event.location = params[:location]
    @event.admin = current_user

    if @event.save
      flash[:success] = "Evènement sauvegardé!"
      redirect_to(root_path)
    else
      render "new"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + @event.duration
  end

  def update
    @event = Event.find(params[:id])
    event_params = params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
    if @event.update(event_params)
      flash[:success] = "Evènement mis à jour."
      redirect_to(@event)
    else
      render :edit
    end
  end

end
