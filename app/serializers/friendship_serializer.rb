class FriendshipSerializer < ActiveModel::Serializer
  attributes :following


  def following
    following = User.where(id: self.object.friend_id).select(:username, :id).take
  end

end
