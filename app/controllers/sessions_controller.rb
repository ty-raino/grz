class SessionsController < ApplicationController

    get '/signin' do
        if signed_in? 
            @users = User.all
            redirect :'/reviews'
        else
            erb :'/sessions/signin'
        end
    end

    post '/signin' do
        if params[:username].blank? || params[:password].blank?
            flash[:error] = "All fields are required to sign in"
            erb :'sessions/signin'
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                flash[:success] = "You are now signed in"
                redirect :'/reviews'
            else
                flash[:error] = "Incorrect email or password"
                erb :'/sessions/signin'
            end
        end
    end
    
    delete '/signout' do
        session.clear
        flash[:success] = "Signed out"
        redirect '/'
    end
end