require 'rails_helper'

RSpec.describe 'entities/new', type: :view do
  before do
    @entity = Entity.new
    @id = 1
    @name = 'Food'
    @group = Group.create(name: 'Food',
                          user: User.create(name: 'Test User', email: 'test@example.com',
                                            password: 'password'))
    assign(:entity, @entity)
    assign(:id, @id)
    assign(:name, @name)
    assign(:group, @group)
    render
  end

  it 'renders form labels' do
    expect(rendered).to have_selector('label', text: 'Name')
    expect(rendered).to have_selector('label', text: 'Amount')
  end

  it 'renders required input fields' do
    expect(rendered).to have_selector('input[type="text"][name="entity[name]"][required]')
    expect(rendered).to have_selector('input[type="number"][name="entity[amount]"][required]')
  end

  it 'renders submit button' do
    expect(rendered).to have_button('Add transaction')
  end

  it 'displays the form within the register-container' do
    expect(rendered).to have_selector('.register-container form')
  end
end
