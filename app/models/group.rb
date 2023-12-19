# app/models/group.rb
class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
  has_many :entities, through: :entity_groups
end
