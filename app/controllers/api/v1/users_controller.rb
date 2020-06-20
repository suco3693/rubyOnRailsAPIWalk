class Api::V1::UsersController < ApplicationController
    #Get /users
    def index
        @users = User.all
        render json: @users
    end

    #Get /user/:id
    def show
        @user = User.find(params[:id])
        render json: @users
    end

    #POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: {
                error: "Unable to create User.",
                status: 400 
                }, status: 400
        end
    end

    #PUT /users/:id
    def update 
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {
                error: "User successfully updated.",
                status: 200 
                }, status: 200
        else
            render json: {
                error: "'Unable to update user.",
                status: 400 
                }, status: 400
        end
    end

    #DELETE /user/:id
    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy
            render json: {
                error: "User successfully deleted",
                status: 200
            }, status: 200
        else
            render json: {
                error: "Unable to delete User",
                status: 400
            }, status: 400
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
