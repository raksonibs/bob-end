class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :story, :title, :publishedAt, :image_url
  has_one :location
  has_many :favourites
  has_many :users
end
