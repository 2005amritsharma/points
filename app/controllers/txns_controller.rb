class TxnsController < ApplicationController

  def index
    @cumulative_points = Txn.cumulative_points
    if params[:txnDate]
      txn_date = DateTime.strptime(params[:txn][:txn_date], '%m/%d/%Y')
      @txns = Txn.history txn_date
      @total_score = Txn.total_points txn_date
    else
      @txns = Txn.history Date.today
      @total_score = Txn.total_points Date.today
    end
  end

  def new
    @cumulative_points = Txn.cumulative_points
    @total_score = Txn.total_points Date.today
    @activities = Activity.all
  end

  def create
    @txn = Txn.new(params[:txn])
    @txn.txn_date = DateTime.strptime(params[:txn][:txn_date], '%m/%d/%Y')
    @txn.save

    @total_score = Txn.total_points Date.today
    @cumulative_points = Txn.cumulative_points
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Txn.find(params[:id]).destroy
    redirect_to txns_path
  end

end
