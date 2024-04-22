# app/controllers/tweets_controller.rb
class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_url, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
        format.js
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content, :image, :video)
  end
end
