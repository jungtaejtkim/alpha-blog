require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@category = Category.create(name: "sports")
		@category2 = Category.create(name: "programming")
	end


	test "should show categories listing" do
		get categories_path 
		assert_template 'categories/index'
		assert_select "a[href=?]", category_path(@category), text: @category.name #link 가 category_path 를 바라보고있는지 보아라. text 는 sports 가 맞는지 보아라
		assert_select "a[href=?]", category_path(@category2), text: @category2.name
	end


end
