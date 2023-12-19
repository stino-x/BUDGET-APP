# spec/models/group_spec.rb

require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'should save group with valid attributes' do
    group = Group.new(name: 'My Group', icon: 'icon.png')
    expect(group.save).to be_truthy
  end

  it 'should not save group without a name' do
    group = Group.new(icon: 'icon.png')
    expect(group.save).to be_falsey
  end

  it 'should have and belong to many users' do
    group = Group.new(name: 'My Group', icon: 'icon.png')
    expect(group).to respond_to(:users)
  end

  it 'should have and belong to many entities' do
    group = Group.new(name: 'My Group', icon: 'icon.png')
    expect(group).to respond_to(:entities)
  end
end
