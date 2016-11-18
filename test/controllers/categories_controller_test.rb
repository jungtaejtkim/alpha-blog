require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	def setup
		@category = Category.create(name: "sports") #show 의 경우 명확한 category 가 필요하므로 test db 에 hit 할 수 있는걸 준비
	end



	test "should get categories index" do 
		get :index
		assert_response :success	
	end

	test "should get new" do
		get :new
		assert_response :success
	end

	test "should get show" do
		get(:show, {'id' => @category.id}) #show 의 경우 명확한 c a tegory 가 필요하므로 setup 에서 만든 category 를 찾아라! 라는것 show path 는 category id 가 필요함
		assert_response :success
	end



end
