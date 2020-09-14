class UsersController < ApplicationController
  
  get '/register' do
    erb :'users/register'
  end

  post '/register' do
    if params[:username].blank? || params[:email].blank? || params[:password].blank?
      flash[:error] = "All fields are required to register"
      redirect :'/register'
    elsif User.find_by(username: params[:username])
      flash[:error] = "Username already taken"
      redirect :'/register'
    elsif User.find_by(email: params[:email])
      flash[:error] = "An account already exists with this email"
      redirect :'/register'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in"
      redirect :'/reviews'
    end
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    if @user
      erb :'users/profile'
    else
      not_found
    end
  end
  
end
