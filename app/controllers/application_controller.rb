require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"]
    set :method_override, true

    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

  # not_found do
  # end

private

  def current_user
    User.find_by_id(session[:user_id])
  end

  def signed_in?
    !!current_user
  end

end
