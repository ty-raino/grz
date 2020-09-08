class SessionsController < ApplicationController

    get '/signin' do
        if signed_in? 
            @users = User.all
            redirect :'/'
        else
            erb :'/sessions/signin'
        end
    end

    post '/signin' do
        if params[:username].empty? || params[:password].empty?
            flash[:error] = "All fields are required to sign in"
            erb :'sessions/signin'
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.user_id
                flash[:success] = "You are now logged in!"
                redirect :'/'
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