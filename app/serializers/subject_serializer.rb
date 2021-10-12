class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :description, :city, :state, :public, :username, :avg_rating, :created_at, :updated_at

  has_many :reviews

  def username
    User.find(self.object.user_id).username
  end

  def avg_rating
    reviews = Review.where(subject_id: self.object.id)
    reviews.average('rating')
  end

end
