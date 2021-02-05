class PurchasesController < ApplicationController

  before_action :user_verification

  def new
    user_verification
    @purchase = Purchase.new
  end


  private

  def user_verification
    redirect_to root_path unless session[:user_id] == params[:user_id].to_i
  end

  
end
