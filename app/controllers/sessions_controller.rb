class SessionsController < ApplicationController
    def new
    end

    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        #checks if the user's password is correct with user.authenticte.... 
        session[:user_id] = user.id
        redirect_to user_path(user), notice: "Logged in!"
      else
        flash.now[:alert] = "Email or password is invalid"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: "Logged out!"
    end

    def googleAuth
      # Get access tokens from the google server
      access_token = request.env["omniauth.auth"]
      user = User.from_omniauth(access_token)
      # User.from_omnit... calls the user object from the user.rb meth. then stores a variable. and then saves it. 
      user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
    
  end