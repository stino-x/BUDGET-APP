# test/models/user_test.rb
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save user with valid attributes' do
    user = User.new(name: 'John Doe')
    assert user.save
  end

  test 'should not save user without a name' do
    user = User.new
    assert_not user.save
  end

  test 'should have many entities' do
    user = User.new(name: 'John Doe')
    assert_respond_to user, :entities
  end

  test 'should have and belong to many groups' do
    user = User.new(name: 'John Doe')
    assert_respond_to user, :groups
  end
end
