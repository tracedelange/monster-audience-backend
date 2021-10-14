class FriendshipsController < ApplicationController
    before_action :set_current_user

    def index
        render json: @user.friends, status: :ok
    end

    def create
        
        newFriendShip = @user.friendships.create(friendship_params)
        if newFriendShip.valid?
            render json: newFriendShip, status: :created
        else
            render json: {errors: newFriendShip.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        friendship = Friendship.find_by(user_id: @user.id, friend_id: friendship_params[:id])
        friendship.destroy
        if friendship.destroyed?
            head :no_content, status: :ok
        else
            render json: {errors: "User not found."}
        end
    end

    private

    def friendship_params
        params.permit(:id, :friend_id)
    end

end

# friendships GET    /friendships(.:format)                                                                           friendships#index
# POST   /friendships(.:format)                                                                                       friendships#create
# friendship DELETE /friendships/:id(.:format)                                                                        friendships#destroy