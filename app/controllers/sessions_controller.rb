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
            erb :'sessions/signin'
        else
            @user = User.find_by(username: params[:username], email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.user_id
                redirect :'/'
            else
                @error = "Incorrect email or password"
                erb :'/sessions/signin'
            end
        end
    end

    delete '/signout' do
        session.clear
        redirect '/'
    end
end