require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

	def setup #런 하기전 모두 한다
		@category=Category.new(name: "sports")
	end


	test "category should be valid" do 
		assert @category.valid?
		
	end


	test "name should be present" do
		@category.name = " " #empty string
		assert_not @category.valid? # 맞는 여러가지 조건을 넣는거보다, 틀린 한가지 조건을 넣는게 테스트가 더 명료하기때문에
	end

	test "name should be unique" do
		@category.save
		@category2 = Category.new(name: "sports")
		assert_not @category2.valid? # 맞는 여러가지 조건을 넣는거보다, 틀린 한가지 조건을 넣는게 테스트가 더 명료하기때문에
	end


	test "name should not be too long" do
		@category.name = "a" * 26
		assert_not @category.valid? # 맞는 여러가지 조건을 넣는거보다, 틀린 한가지 조건을 넣는게 테스트가 더 명료하기때문에
	end


	test "name should not be too short" do
		@category.name = "a"*2
		assert_not @category.valid? # 맞는 여러가지 조건을 넣는거보다, 틀린 한가지 조건을 넣는게 테스트가 더 명료하기때문에
	end

end
