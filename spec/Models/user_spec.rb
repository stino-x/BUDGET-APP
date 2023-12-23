# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe')
    expect(user.valid?).to be_truthy
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user.valid?).to be_falsey
  end

  it 'has many entities' do
    user = User.new(name: 'John Doe')
    # Assuming you have an Entity model
    entity = Entity.new(name: 'Expense', amount: 50.0, author: user)
    user.entities << entity
    expect(user.entities).to include(entity)
  end

  it 'has many groups' do
    user = User.new(name: 'John Doe')
    # Assuming you have a Group model
    group = Group.new(name: 'My Group', user:)
    user.groups << group
    expect(user.groups).to include(group)
  end
end
