class MoverSerializer < ActiveModel::Serializer
  belongs_to :game_type
  belongs_to :match 
  has_many :moves
  
  attributes :id
end
