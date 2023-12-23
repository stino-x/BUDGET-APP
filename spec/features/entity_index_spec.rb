require 'rails_helper'

RSpec.describe 'groups/show', type: :view do
  let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password') }
  let(:group) { Group.create(name: 'Food', user:) }
  let(:entity1) { Entity.create(name: 'Lunch', amount: 10, author: user) }
  let(:entity2) { Entity.create(name: 'Dinner', amount: 15, author: user) }

  before do
    assign(:group, group)
    assign(:entities, [entity1, entity2])
    render
  end

  it 'displays group name' do
    expect(rendered).to have_content(group.name)
  end
end
