class UsersController < ApplicationController

    def index

        unless params[:name] 
            users = User.all
            render json: users
        else
            user = User.find_by(username: params[:name])
            if user.nil? 
                render json: "user not found"
            else
                render json: user
            end            
        end
    end

    def create

        user = User.new(params.require(:user).permit(:username))
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
        user = User.find(params[:id])
        if user.update(user_params)
           redirect_to user_url(user)
        else
           render json: user.errors.full_messages, status: :unprocessable_entity # rails method, same as 422
        end
    end

    
    def destroy
        users = User.find(params[:id])        
        users.destroy
        redirect_to users_url
    end

    private

    def user_params
        # debugger
        params.require(:user).permit(:username)
    end
end