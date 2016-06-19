class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :story, :title, :publishedAt
  has_one :location
end
