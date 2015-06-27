require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Chicken Parm", summary: "This is the best chicken parm recipe ever", description: "Heat oil, add onion, add tomato sauce, add chicken, cook for 20 minutes")
  end

  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Chef ID is associated with any created Recipe" do
    @recipe.chef_id = " "
    assert_not @recipe.valid?
    
  end
  
  test "name should be valid" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "Name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    
    @recipe.name = "a" * 4
    assert_not @recipe.valid?
    
  end
  
  test "Summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "Summary length must not be too short" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too long" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end

  test "Description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "Description length must not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end


end