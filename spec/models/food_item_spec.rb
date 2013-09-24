require 'spec_helper'

describe FoodItem do
  it{should have_valid(:title).when('Guac', "something")}
  it {should_not have_valid(:title).when(nil, " ")}

  it{should have_valid(:description).when('Guac', "something")}
  it {should_not have_valid(:description).when(nil, " ")}

  it{should have_valid(:quantity).when(99)}
  it {should_not have_valid(:quantity).when(nil, "string")}
end
