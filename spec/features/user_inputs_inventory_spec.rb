require'spec_helper'


describe'user inputs inventory into system', %Q{
      As a food service employee
      I want to receive inventory
      So that it can be recorded that we have food items
} do

#   Acceptance Criteria:

#  *I must specify a title, description, and quantity
#     of the food item
#  *If I do not specify the required information,
#     I am prompted to fix errors and to resubmit
#  *If I specify the required information,
#     my inventory entry is recorded.

  context' with valid attributes' do
    title = 'food'
    description = 'scrumptious'
    quantity = 10

    previous_inventory_count =Inventory.all.count
    visit new_food_item_path
    fill_in 'Title', with: title
    fill_in 'Description', with: description
    fill_in 'Quantity', with: quantity
    click_on 'Enter Inventory'

    expect(page).to have_content('Food item successfully entered.')
    expect(previous_inventory).to eql(
        previous_inventory_count+1)
  end

  context 'with invalid attributes' do
    visit new_food_item_path

    previous_inventory_count = Inventory.all.count
    click_on 'Enter Inventory'
    expect(page).to have_content('Food item successfully entered.')
    expect(previous_inventory).to eql(
      previous_inventory_count)
  end
end
