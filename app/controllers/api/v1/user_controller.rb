class Api::V1::UserController < ApplicationController

    def new
     @user = User.new
     render json: @user
    end

    def index
      @users = User.all
      render json: @users
    end


    def create
     @user = User.create(user_params)
     if @user.save
      render json: @user
    else render json: {error: 'Signup failed'}
     end
    }
    end

    def show
     @user = User.find_by(id: params[:id])
    end

    def update
    
    end

    def destroy
    
    end

end