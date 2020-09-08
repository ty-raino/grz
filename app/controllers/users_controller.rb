class UsersController < ApplicationController
  
  get '/register' do
    erb :'users/register'
  end

  post '/register' do
    if params[:username].blank? || params[:email].blank? || params[:password].blank?
      redirect :'/register'
    elsif User.find_by(username: params[:username])
      redirect :'/register'
    elsif User.find_by(email: params[:email])
      redirect :'/register'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect :'/'
    end
  end
end
