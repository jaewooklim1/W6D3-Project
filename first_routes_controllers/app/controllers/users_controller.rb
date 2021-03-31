class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end

    def create

        user = User.new(params.require(:user).permit(:name, :email))
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end   

    end

    def show
        users = User.find(params[:id])
        render json: users
    end

    def update
        users = User.find(params[:id])
        if users.update(user_params)
           redirect_to user_url(users)
        else
           render json: users.errors.full_messages, status: :unprocessable_entity # rails method, same as 422
        end
    end

    
    def destroy
        users = User.find(params[:id])        
        users.destroy
        redirect_to users_url
    end


    def user_params
        # debugger
        params.require(:user).permit(:name, :email)
    end
end