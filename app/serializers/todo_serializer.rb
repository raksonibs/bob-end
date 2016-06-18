class TodoSerializer < ActiveModel::Serializer
  attributes :id, :text, :complete
end
