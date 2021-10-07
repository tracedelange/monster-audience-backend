class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_link, :created_at, :social_counts


  def social_counts

    @user = User.find(self.object.id)

    following_count = @user.friends.count
    follower_count = Friendship.where(friend_id: @user.id).count

    {"following" => following_count, "followers" => follower_count}

  end

end
