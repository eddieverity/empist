class DrinksController < ApplicationController

def index
  @history = Order.where('user_id = ?', session[:user_id]).reverse
  @admin_history = Order.where('status = ?', "pending").reverse
end

def order
  @order = Order.new(item: params[:order][:item], user_id: session[:user_id], sugar: params[:order][:sugar], cream: params[:order][:cream], status: "pending")
  if @order.save    
      redirect_to '/drinks'
  else
      flash[:register] = @user.errors.full_messages
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
        @order.update(user_params)
        redirect_to '/drinks'
end

private
    def order_params
        params.require(:order).permit(:item, :user_id, :sugar, :cream, :status)
    end

end
