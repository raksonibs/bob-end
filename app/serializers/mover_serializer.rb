class MoverSerializer < ActiveModel::Serializer
  attributes :id
  
  belongs_to :game_type
  belongs_to :match 
  has_many :moves
end
