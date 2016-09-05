class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :access_token, :created_at

  has_many :stores

  link(:self) { user_url(object) }
end
