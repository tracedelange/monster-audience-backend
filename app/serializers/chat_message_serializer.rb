class ChatMessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :read
  belongs_to :author
end
