class UsersController < ApplicationController
  
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username].blank? || params[:email].blank? || params[:password].blank?
      flash[:error] = "All fields are required to sign up."
      redirect :'/signup'
    elsif User.find_by(username: params[:username])
      flash[:error] = "Username already taken"
      redirect :'/signup'
    elsif User.find_by(email: params[:email])
      flash[:error] = "An account already exists with this email"
      redirect :'/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect :'/'
    end
  end
end
