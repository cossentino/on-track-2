class PurchasesController < ApplicationController

  before_action :user_verification

  def new
    @purchase = current_user.purchases.build
  end

  def index
    @purchases = Purchase.where(user_id: current_user.id )
  end

  def create
    binding.pry
    purchase = Purchase.new(purchase_params)
    if purchase.save
      redirect_to '/dashboard'
    else
      flash[:alert] = "Purchase couldn't save, please try again"
      redirect_to '/'
    end
  end


  private

  def user_verification
    redirect_to root_path unless session[:user_id] == params[:user_id].to_i
  end

  def purchase_params
    params.require(:purchase).permit(:location, :date, :note, :total, :category_id, :user_id)
  end

  
end
