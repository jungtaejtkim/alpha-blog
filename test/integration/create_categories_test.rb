require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	def setup
		@user = User.create(username: "Doe", email: "doe@ex.com", password: "password", admin: true)
	end

	
	test "get new category form and create category" do
		sign_in_as(@user, "password") 
		# sign_in_as method 는 test_helper.rb 에서 정의함 
		# 위에서 정의한 admin 계정으로 접속시킴
		#"password" 안써주면 hash digest 의 외계어로 비번을 자동으로 넣어버림
		# session[:user_id] = @user.id  << 이걸로 해도됨 
		get new_category_path
		assert_template 'categories/new'		
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: {name: "sports"}
		end
		assert_template 'categories/index'
		assert_match "sports", response.body # 위 블록에서 만들어진 sports 가 인덱스페이지에 렌딩되는지 매치
	end

	test "invalid category submission result in failure" do
		sign_in_as(@user, "password")
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
