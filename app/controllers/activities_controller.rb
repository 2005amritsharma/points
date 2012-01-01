class ActivitiesController < ApplicationController

 def index
   @activities = Activity.all
 end

 def new
  @activity = Activity.new
 end

 def create
  
 end

 def show
  @activity = Activity.find(params[:id])
 end

 def edit
 end

 def update
 end

 def delete
 end 

end
