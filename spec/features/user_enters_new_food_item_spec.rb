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
  title = 'Guacamole'
  description = 'scrumptious'
  quantity = 10

   it' enter valid info'do

      previous_food_item_count = FoodItem.all.count

      visit '/food_items/new'
      fill_in 'Title', with: title
      fill_in 'Description', with: description
      fill_in 'Quantity', with: quantity
      click_on 'Enter New Inventory'

      expect(page).to have_content(
        'Food item successfully entered.')
      expect(page).to have_content title
      expect(page).to have_content description
      expect(page).to have_content quantity

      new_food_item_count = FoodItem.all.count
      expect(new_food_item_count).to eql(
          previous_food_item_count+1)
    end


    it' enter valid info'do
      visit '/food_items/new'

      previous_food_item_count = FoodItem.all.count
      click_on 'Enter New Inventory'

      expect(page).to_not have_content title
      expect(page).to_not have_content description
      expect(page).to_not have_content quantity
      expect(page).to have_content(
        'Please submit the required fields.')

      new_food_item_count = FoodItem.all.count
      expect(new_food_item_count).to eql(
        previous_food_item_count)
    end
  end
end
