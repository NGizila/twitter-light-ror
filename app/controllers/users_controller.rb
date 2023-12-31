class UsersController < ApplicationController

  # GET /users or /users.json
  def index
    @users = User.all
    @tweet = Tweet.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find_by_id(params[:id]) #find_by_id holds nil if users id doesn't exist
    redirect_to(root_url, :notice => 'Record not found') unless @user
    @tag = Tag.all.group("name").count
    @sorted_tag = Hash[@tag.sort_by{|k, v| v}.reverse].first(5)
    #seeing only this user post on their profile
    @tweet = Tweet.all.where("user_id = ?",@user.id)
    @user_list = User.all.where("id <> ?",@user.id)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to users_url
  end

  private

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:tweetname, :img_url)
    end

  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :error => "Record not found." }
end
