# app/models/entity.rb
class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :entity_groups
  has_many :groups, through: :entity_groups

  validates :name, presence: true
end
