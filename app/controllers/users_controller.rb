class UsersController < ApplicationController
  
  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username].blank? || params[:email].blank? || params[:password].blank?
      redirect :'/signup'
    elsif User.find_by(username: params[:username])
      redirect :'/signup'
    elsif User.find_by(email: params[:email])
      redirect :'/signup'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect :'/'
    end
  end
end
