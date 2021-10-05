class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :description, :city, :state, :public

  has_many :reviews
end
