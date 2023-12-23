# spec/models/group_spec.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'John Doe')
    group = Group.new(name: 'My Group', icon: 'icon.png', user:)
    expect(group).to be_valid
  end

  it 'is not valid without a name' do
    group = Group.new(icon: 'icon.png', user: User.create(name: 'John Doe'))
    expect(group).not_to be_valid
  end

  it 'belongs to a user' do
    group = Group.new(name: 'My Group', icon: 'icon.png', user: User.create(name: 'John Doe'))
    expect(group.user).to be_an_instance_of(User)
  end

  it 'has many entities through entity_groups' do
    user = User.create(name: 'John Doe')
    group = Group.create(name: 'My Group', user:)

    # Create an entity and associate it with the group
    entity = Entity.create(name: 'Expense', amount: 50.0, author: user)
    EntityGroup.create(entity:, group:)

    expect(group.entities).to include(entity)
  end
end
