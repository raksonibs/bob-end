class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :crypted_password, :salt
end
