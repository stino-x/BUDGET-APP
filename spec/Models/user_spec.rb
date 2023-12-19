# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should save user with valid attributes' do
    user = User.new(name: 'John Doe')
    expect(user.save).to be_truthy
  end

  it 'should not save user without a name' do
    user = User.new
    expect(user.save).to be_falsey
  end

  it 'should have many entities' do
    user = User.new(name: 'John Doe')
    expect(user).to respond_to(:entities)
  end

  it 'should have and belong to many groups' do
    user = User.new(name: 'John Doe')
    expect(user).to respond_to(:groups)
  end
end
