class UsersController < ApplicationController
  def signin
  end

  # create new user
  def create
        @user = User.new(user_params)
        @code = 'secret_code'
        
        if @user[:code] == @code
          @user.admin = true
        else
          @user.admin = false
        end
        
        if @user.save
            session[:user_id] = @user.id
            session[:user_email = @user.email
            session[:user_admin] = @user.admin
            redirect_to '/drinks'
        else
            flash[:register] = @user.errors.full_messages
            redirect_back(fallback_location: users_signin_path)
        end
  end

  # login existing user
  def login
      @user = User.find_by('email = ?', params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])

          session[:user_id] = @user.id
          session[:user_email = @user.email
          session[:user_admin] = @user.admin
          redirect_to '/drinks'
      else
          flash[:login] = ["Invalid Email or Password"]
          redirect_back(fallback_location: users_signin_path)
      end
  end

  def logout
        reset_session
        redirect_to '/'
  end

private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :admin, :code)
    end
   
end
