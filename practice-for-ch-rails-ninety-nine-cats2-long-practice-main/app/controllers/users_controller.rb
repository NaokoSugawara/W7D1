class UsersController < ApplicationController # ADD BEFORE ACTIONS

    def new
        @user = User.new # for rerender and autofill in views
        render :new
    end

    def create
        # debugger
        @user = User.new(user_params)
        if @user.save
            # redirect_to user_url(@user)
            render json: @user
        else
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password) 
    end

end
