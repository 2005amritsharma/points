class TxnsController < ApplicationController

 def index
   @txns = Txn.all
 end

 def new
  @activities = Activity.all
  @total_score = Txn.total_points Date.today
 end

 def create
    @txn = Txn.new(params[:txn])
    if @txn.save
      redirect_to txns_path
    else
      render 'new'
    end  
 end

 def edit
  @txn = Txn.find(params[:id])
 end

 def update
   @txn = Txn.find(params[:id])
   if @txn.update_attributes(params[:txn])
     redirect_to txns_path
   else
     render 'edit'
   end 
 end

 def destroy
  Txn.find(params[:id]).destroy
  redirect_to txns_path
 end 

end
