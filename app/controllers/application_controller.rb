require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV.fetch("SESSION_SECRET")
    set :method_override, true

    register Sinatra::Flash
  end

  get "/" do
    erb :'welcome'
  end

  not_found do
    flash[:error] = "Page not found"
    if signed_in?
      redirect :"/reviews"
    else
      redirect '/'
    end
  end

private

  def current_user
    User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

  def redirect_if_not_signed_in 
    if !signed_in?
      flash[:error] = "Sign in to view that page"
      redirect '/login'
    end
  end

end
