class Api::V1::PromotionsController < ApplicationController
    before_action :authenticate_api_v1_user!

    def index
        promotions = Promotion.all
        render json: promotions
    end
    
    def show
        promotion = Promotion.find(params[:id])
        render json: promotion
    end
    
    def create
        # ユーザー認証
        promotion = @current_api_v1_user.promotions.build(promotion_params)
        #promotion = Promotion.new(promotion_params)
    
        if promotion.save
            render json: promotion
        else
            render json: promotion.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        promotion = Promotion.find(params[:id])
        promotion.delete
    end
    
    private
    
    def promotion_params
        params.permit(:title, :content, :user_id)
    end
end
