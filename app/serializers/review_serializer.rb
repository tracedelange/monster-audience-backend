class ReviewSerializer < ActiveModel::Serializer
  attributes :user_id, :rating, :created_at, :updated_at, :content, :username, :created_at, :id, :subject_id


  def username
    User.find(self.object.user_id).username
  end

end
