# test/models/entity_test.rb
require 'test_helper'

class EntityTest < ActiveSupport::TestCase
  test 'should save entity with valid attributes' do
    user = User.create(name: 'John Doe')
    entity = Entity.new(name: 'Expense', amount: 50.0, user:)
    assert entity.save
  end

  test 'should not save entity without a name' do
    entity = Entity.new(amount: 50.0)
    assert_not entity.save
  end

  test 'should belong to a user' do
    entity = Entity.new(name: 'Expense', amount: 50.0)
    assert_respond_to entity, :user
  end

  test 'should have and belong to many groups' do
    entity = Entity.new(name: 'Expense', amount: 50.0)
    assert_respond_to entity, :groups
  end
end
