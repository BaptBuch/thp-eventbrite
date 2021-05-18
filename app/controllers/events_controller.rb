class EventsController < ApplicationController
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

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + @event.duration
  end

end
