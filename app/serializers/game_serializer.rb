class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :custom_name
  
  def custom_name
    "test"
  end
end
