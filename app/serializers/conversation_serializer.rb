class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :updated_at
  belongs_to :user
  belongs_to :recipient
end
