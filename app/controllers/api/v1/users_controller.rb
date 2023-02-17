class Api::V1::UsersController < ApplicationController
    before_action :authenticate_api_v1_user!

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: { status: 'SUCCESS', message: 'Updated the user', data: user }
        else
            render json: { status: 'ERROR', message: 'Not updated', data: user.errors }
        end
    end

    private

    def user_params
        params.permit(:id, :name, :sentence)
    end

end
