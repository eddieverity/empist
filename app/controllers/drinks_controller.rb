class DrinksController < ApplicationController

def index
  redirect_to '/users/signin' unless session[:user_id]
  @history = Order.where('user_id = ?', session[:user_id]).reverse
  @admin_history = Order.where('status = ?', "pending").reverse
  @admin_accepted = Order.where('status = ?', "accepted").reverse
  @admin_denied = Order.where('status = ?', "denied").reverse
  @admin_completed = Order.where('status = ?', "completed").reverse
  @admin_cancelled = Order.where('status = ?', "cancelled").reverse
end

def order
  @order = Order.new(item: params[:order][:item], user_id: session[:user_id], sugar: params[:order][:sugar], cream: params[:order][:cream], status: "pending")
  if @order.save    
      redirect_to '/drinks'
  else
      flash[:order] = @order.errors.full_messages
      redirect_back(fallback_location: users_signin_path)
  end
end

def update
  @order = Order.find_by('id = ?', params[:order_id])
  @user.update(order_params)
  redirect_to '/drinks'
end

def delete
  @order = Order.find_by('id = ?', params[:order_id])
    @order.destroy
    redirect_to '/drinks'
end

def accept

end

def deny

end

def status
  @order = Order.find_by('id = ?', params[:order_id])
        @order.update(status: params[:order][:status], comment: params[:order][:comment])
        redirect_to '/drinks'
end

private
    def order_params
        params.require(:order).permit(:item, :user_id, :sugar, :cream, :status)
    end

end
