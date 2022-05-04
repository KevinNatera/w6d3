class UsersController < ApplicationController

    def index   
        @users = User.all
        render json: @users
    end

    def user_params
        params.require(:user).permit(:name,:email)
    end

    def create
        user =  User.new(user_params)
        
        if user.save
            redirect_to user_url(user.id)
        else  
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
      end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def edit
        render json: params
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy 
        redirect_to users_url
    end

end