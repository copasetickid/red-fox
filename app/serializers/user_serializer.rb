class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at

  has_many :stores

  link(:self) { user_url(object) }
end
