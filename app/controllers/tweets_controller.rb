class TweetsController < ApplicationController
  #before_action :set_tweet, only: %i[ show edit update destroy ]

  # GET /users/1/tweets or  /users/1/tweets.json
  def index
    @tweets = Tweet.all.order("created_at DESC")
    #Tweet.all
  end

  # GET /users/1/tweets/1 or /users/1/tweets/1.json
  def show
  end

  # GET /users/1/tweets/new
  def new
    @tweet = Tweet.new
    #@listing.tweets.create(params:[:tweet].merge(user:user))
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /users/1/tweets or /users/1/tweets.json
  def create
    @user = User.find(params[:user_id])
    @tweet =  @user.tweets.create(tweet_params)
    redirect_to user_path(@user)

    #respond_with @tweet
    #Tweet.new(tweet_params)
    #private

    #respond_to do |format|
    #  if @tweet.save
    #    format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
    #    format.json { render :show, status: :created, location: @tweet }
    #  else
    #    format.html { render :new, status: :unprocessable_entity }
    #    format.json { render json: @tweet.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /users/1/tweets/1 or /users/1/tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to user_path(@user)
    
  end

    # Only allow a list of trusted parameters through.
  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
