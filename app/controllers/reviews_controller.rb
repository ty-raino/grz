class ReviewsController < ApplicationController

  # GET: /reviews
  get "/reviews" do
    @reviews = Review.all
    erb :"/reviews/main"
  end

  # GET: /reviews/create
  get "/reviews/create_rev" do
    if signed_in?
      @review = Review.new
      erb :"/reviews/create_rev"
    else
      flash[:error] = "Sign in to make a review"
      redirect :'/login'
    end
  end

  # POST: /reviews
  post "/reviews" do
    redirect_if_not_signed_in
      @review = current_user.reviews.build(game_title: params[:review][:title], body: params[:review][:body])
    if @review.save
      redirect "/reviews"
    else
      erb :'/reviews/create_rev'
    end
      
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    set_post
    erb :"/reviews/show"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    set_post
    redirect_if_not_authorized
    erb :"/reviews/edit_rev"
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    set_post
    redirect_if_not_authorized
    if @review.update(game_title: params[:review][:game_title], body: params[:review][:body])
      flash[:success] = "Review updated"
      redirect "/reviews/#{@review.id}"
    else
      erb :'/review/edit_rev'
    end
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id" do
    set_post
    redirect_if_not_authorized
    @review.destroy
    redirect "/reviews"
  end

private
  def set_post
    @review = Review.find_by_id(params[:review_id])
    if @review.nil?
      flash[:error] = "Review not found"
      redirect '/reviews'
    end
  end

  def redirect_if_not_authorized
    redirect_if_not_signed_in
    if !authorize_review(@review)
      flash[:error] = "You don't have permission to do that action"
      redirect '/reviews'
    end
  end

  def authorize_review(review)
    current_user == review.user
  end
end
