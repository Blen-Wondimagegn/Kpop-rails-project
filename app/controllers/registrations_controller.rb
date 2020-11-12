class RegistrationsController < Devise::RegistrationsController
before_action :authenticate_user!, except:[:home]

    private
        def sign_up_params
            params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
        end

        def account_update_params
            params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
        end 
end 