class FoodItemsController < ApplicationController

  def new
    @food_item = FoodItem.new
  end

  def show
    @food_item = FoodItem.find(params[:id])
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    if @food_item.save
      redirect_to food_item_path(@food_item),
        notice: "Food item successfully entered."
    else
      flash.now[:notice] = "Please submit the required fields."
      render action: '../food_items/show'

    end
  end

private
  def food_item_params
    params.require(:food_item).permit(:title, :description, :quantity)
  end
end
