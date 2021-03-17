class Api::UsersController < ApplicationController

    def new

    end

    def index
        @users = User.all
    end
    
    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            render :show
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
end
