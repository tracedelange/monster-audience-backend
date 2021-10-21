class ConversationSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :user
  belongs_to :recipient
end
