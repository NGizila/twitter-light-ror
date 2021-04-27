class RelationshipsController < ApplicationController
    # GET /users/1/relationships or  /users/1/relationships.json

    def create
        user = User.find(params[:followed_id])
        current_user = User.find(params[:user_id])
        current_user.follow(user)
        redirect_to user_path(current_user)
    end

    def destroy
        user = Relationship.find(params[:id]).followed
        current_user = User.find(params[:user_id])
        current_user.unfollow(user)
        redirect_to user_path(current_user)
    end
end