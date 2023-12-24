# app/models/group.rb
# app/models/group.rb
class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups
  has_many :entities, through: :entity_groups

  validates :name, presence: true

  def total
    @total_cost = 0
    entity_groups.includes(:entity).each do |entity_group|
      @total_cost += entity_group.entity.amount
    end
    @total_cost
  end
end
