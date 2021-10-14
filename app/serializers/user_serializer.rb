class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_link, :created_at, :social_counts, :following, :follows



  def follows
    if @instance_options[:current_user]
      @logged_user_id = @instance_options[:current_user].id
      User.find(self.object.id).friends.ids.include? @logged_user_id
    else
      return "N/A"
    end
  end
  
  def following
    if @instance_options[:current_user]
      @logged_user = @instance_options[:current_user]
      @logged_user.friends.ids.include? self.object.id
    else
      return "N/A"
    end
  end


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
