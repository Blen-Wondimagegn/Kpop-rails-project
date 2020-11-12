class CallbacksController < Devise::OmniauthCallbacksController
before_action :authenticate_user!, except:[:home]

    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

end 