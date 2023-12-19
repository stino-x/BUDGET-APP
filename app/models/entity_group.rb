# app/models/entity_group.rb
class EntityGroup < ApplicationRecord
  belongs_to :entity
  belongs_to :group
end
