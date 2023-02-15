class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
    before_action :authenticate_api_v1_user!, except: [:base, :create]

    def base
        if current_api_v1_user
            render json: {
                is_login: true,
                data: current_api_v1_user
            }
        else
            render json: {
                is_login: false,
                message: "no current_user"
            }
        end
    end

    def profile
        render json: {data: current_api_v1_user}
    end


    private

    def sign_up_params
        params.permit(:name, :email, :password, :password_confirmation, :confirm_success_url)
    end
end
