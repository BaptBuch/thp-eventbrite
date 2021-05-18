class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @events=[]
      Event.all.each do |event|
        if event.admin.id == current_user.id.to_i
          @events << event
        end
      end
  end
  
end
