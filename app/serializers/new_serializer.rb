class NewSerializer < ActiveModel::Serializer
  attributes :id, :source, :title, :image

  has_many :comments
  class CommentSerializer < ActiveModel::Serializer
    attributes :user_id, :content, :created_at
  end

  has_many :reacts
  class ReactSerializer < ActiveModel::Serializer
    attributes :like, :report
  end
end
