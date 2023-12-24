# spec/models/entity_spec.rb

require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'should belong to a user' do
    user = User.create(name: 'John Doe')
    entity = Entity.new(name: 'Expense', amount: 50.0, author: user)
    expect(entity.author).to eq(user)
  end

  it 'should have and belong to many groups' do
    entity = Entity.new(name: 'Expense', amount: 50.0)
    group1 = Group.create(name: 'Group 1')
    group2 = Group.create(name: 'Group 2')

    entity.groups << group1
    entity.groups << group2

    expect(entity.groups).to include(group1, group2)
  end
end
