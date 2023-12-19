# test/models/group_test.rb
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  test 'should save group with valid attributes' do
    group = Group.new(name: 'My Group', icon: 'icon.png')
    assert group.save
  end

  test 'should not save group without a name' do
    group = Group.new(icon: 'icon.png')
    assert_not group.save
  end

  test 'should have and belong to many users' do
    group = Group.new(name: 'My Group', icon: 'icon.png')
    assert_respond_to group, :users
  end

  test 'should have and belong to many entities' do
    group = Group.new(name: 'My Group', icon: 'icon.png')
    assert_respond_to group, :entities
  end
end
