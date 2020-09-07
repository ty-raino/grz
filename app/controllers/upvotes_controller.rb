class UpvotesController < ApplicationController

  # GET: /upvotes
  get "/upvotes" do
    erb :"/upvotes/index.html"
  end

  # GET: /upvotes/new
  get "/upvotes/new" do
    erb :"/upvotes/new.html"
  end

  # POST: /upvotes
  post "/upvotes" do
    redirect "/upvotes"
  end

  # GET: /upvotes/5
  get "/upvotes/:id" do
    erb :"/upvotes/show.html"
  end

  # GET: /upvotes/5/edit
  get "/upvotes/:id/edit" do
    erb :"/upvotes/edit.html"
  end

  # PATCH: /upvotes/5
  patch "/upvotes/:id" do
    redirect "/upvotes/:id"
  end

  # DELETE: /upvotes/5/delete
  delete "/upvotes/:id/delete" do
    redirect "/upvotes"
  end
end
