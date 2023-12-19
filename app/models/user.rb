# app/models/user.rb
class User < ApplicationRecord
  has_many :entities
  has_and_belongs_to_many :groups
end
