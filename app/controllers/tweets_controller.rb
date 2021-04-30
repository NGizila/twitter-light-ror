class TweetsController < ApplicationController

  # GET /users/1/tweets or  /users/1/tweets.json
  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  # GET /users/1/tweets/1 or /users/1/tweets/1.json
  def show
    @user = User.find(params[:user_id])
    @tweet = Tweet.find(params[:id])
  end


  # GET /users/1/tweets/new
  def new
    @tweet = Tweet.new
  end

  # POST /users/1/tweets or /users/1/tweets.json
  def create
    @user = User.find(params[:user_id])
    @tweet =  @user.tweets.create(tweet_params)
    redirect_to user_path(@user)
  end


  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])

    @tag = @tweet.tags.ids
    if @tag.any?
      @tag.each do |this_tag|
        @tag = Tag.find_by(id: this_tag)
        @tag.destroy
      end
    end
    @tweet.destroy
    
    redirect_to user_path(@user)
    
  end

    # Only allow a list of trusted parameters through.
  private
    def tweet_params
      params.require(:tweet).permit(:user_id,:content)
    end
end
