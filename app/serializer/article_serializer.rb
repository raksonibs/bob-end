class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :description, :state, :notes, :abstract, :title, :section, :sub_section

  embed :ids
end
