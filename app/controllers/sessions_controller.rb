class SessionsController < ApplicationController

  def create
    user = User.find_by :email => params[:email]

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      render json: {
        logged_in: true,
        user: @user
      }
    else
      render json: {
        status: 401,
        errors: ['Invalid email/password. Please try again.']
      }
    end
  end

  def is_logged_in?
    if session[:user_id] && @current_user.present?
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'User does not exist'
      }
    end
  end


  def destroy
    session[:user_id] = nil
    render json: {
        status: 200,
        logged_out: true
      }
    redirect_to login_path
  end

  private
def session_params
      params.require(:user).permit(:email, :password)
end
end
