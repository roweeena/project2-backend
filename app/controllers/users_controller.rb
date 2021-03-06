class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
     @users = User.all
      if @users
         render json: {
         users: @users
      }
     else
         render json: {
         status: 500,
         error: ['No user found']
     }
    end
  end

  def show
    user = User.find(params[:id])
    character = Character.all.where(user_id: params[:id])
    if user
       render json: {
       user: user,
       character: character
    }
    else
       render json: {
       status: 500,
       errors: ['Account not found']
     }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
        login!
        render json: {
        status: :created,
        user: @user
    }
    else
       render json: {
       status: 500,
       errors: @user.errors.full_messages
    }
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end
