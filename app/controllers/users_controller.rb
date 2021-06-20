class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]
    
    # REGISTER
    def create
        user = User.create(
            email: params[:email],
            password: params[:password]
        )
        render json: user
    end

    # LOGIN
    def login
        @user = User.find_by(email: params[:email])

        # authenticate method from bcrypt
        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
        else 
            render json: {error: "Invalid username or password"},
            :status => :bad_request
        end
    end


    def auto_login
        render json: @user
    end
end
