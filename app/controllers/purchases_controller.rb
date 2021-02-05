class PurchasesController < ApplicationController

  before_action :user_verification

  def new
    @purchase = Purchase.new
    @user = current_user
  end

  def index
    @purchases = Purchase.where(user_id: current_user.id )
  end

  def create

    purchase = Purchase.new(purchase_params)
    if purchase.save
      redirect_to '/dashboard'
    else
      flash[:alert] = "Purchase couldn't save, please try again"
      render :new
    end
  end


  private

  def user_verification
    redirect_to root_path unless session[:user_id] == params[:user_id].to_i
  end

  def purchase_params
    params.require(:purchase).permit(:location, :date, :note, :total, :category_id)
  end

  
end
