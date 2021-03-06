class PurchasesController < ApplicationController

  before_action :user_verification

  def new
    render :new, locals: { purchase: current_user.purchases.build }
  end

  def index
    @purchases = Purchase.my_purchases_by_name(current_user)
  end

  def create
    purchase = Purchase.new(purchase_params)
    if purchase.save
      if params[:commit] == "Save and add another"
        redirect_to new_user_purchase_path(current_user)
      else
        redirect_to '/dashboard'
      end
    else
      render :new, locals: { purchase: purchase }
    end
  end

  def destroy
    Purchase.find_by_id(params[:id]).destroy
    redirect_to user_purchases_path(current_user)
  end

  def edit
    purchase = Purchase.find_by_id(params[:id])
    render :edit, locals: { purchase: purchase }
  end

  def update
    purchase = Purchase.find_by_id(params[:id])
    if purchase.update(purchase_params)
      redirect_to user_purchases_path(current_user)
    else
      render :edit, locals: { purchase: purchase }
    end
  end

  private

  def user_verification
    redirect_to root_path unless session[:user_id] == params[:user_id].to_i
  end

  def purchase_params
    params.require(:purchase).permit(:location, :date, :note, :total, :category_id, :user_id, category_attributes: [:name])
  end




  
end
