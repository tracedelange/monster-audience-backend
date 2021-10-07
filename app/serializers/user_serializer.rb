class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_link, :created_at, :social_counts


  def social_counts

    @user = User.find(self.object.id)

    following_count = @user.friends.count
    follower_count = Friendship.where(friend_id: @user.id).count

    review_count = Review.where(user_id: @user.id).count
    subject_count = Subject.where(user_id: @user.id).count

    avg = Review.where(user_id: @user.id)
    

    {"following" => following_count, "followers" => follower_count, "reviews" => review_count, "subjects" => subject_count, "avg_rating" => avg.average('rating')}

  end

end
