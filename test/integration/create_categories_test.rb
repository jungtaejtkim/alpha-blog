require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new category form and create category" do
		get new_category_path
		assert_template 'categories/new'		
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: {name: "sports"}
		end
		assert_template 'categories/index'
		assert_match "sports", response.body # 위 블록에서 만들어진 sports 가 인덱스페이지에 렌딩되는지 매치
	end

	test "invalid category submission result in failure" do
		get new_category_path
		assert_template 'categories/new'		
		assert_no_difference 'Category.count' do #추가되길원치않음
			post categories_path, category: {name: " "} #valid 실패하고 new 가 render 될 거기때문에 redirect 굳이 필요없음
		end
		assert_template 'categories/new'
		assert_select 'h2.panel-title' #error partial 내의 요소 - error.partial 이 render 됐는지 알 수 있음 
		assert_select 'div.panel-body' #error partial 내의 요소
	end



end
