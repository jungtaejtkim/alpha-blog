class SessionsController < ApplicationController #인스턴스변수를 만들지 않는 로그인시 정보를 담는 session 해쉬임

	def new #simply render log in form 
		
	end

	def create #log in - start session state: lonin 으로, 내부에 authenticate 가 필요함
		user = User.find_by(email: params[:session][:email].downcase) # 입력된 이메일 (세션 해쉬내에 존재) 로 유저를 찾는다. 유저 컨트롤러가 아니라서 유저 인스턴스버라이어블은 당연히 안씀
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id  #세션 해쉬내에 user_id 만듬 -> 브라우져 back 이기 때문에 브라우져가 쿠키형태로 관리해서 해당 정보를 이용함. 로그인이 안된경우는 :user_id 는 nil 
			flash[:success] = "You have successfully logged in"
			redirect_to user_path(user) #개별 유저 show 페이지로

		else # model back form 이 아니라서 validation 불가, validation 은 모델에서 back 해줘야 가능함
			flash.now[:danger] = "There was something with your login info" #flashnow : flash 는 액션이 브라우저에 한번 리퀘스트 해준뒤 다음페이지에 보여짐 여기는 다시 new 로 렌더하기 때문에, 브라우져에 새로운 리퀘스트로 인식되지않음 그래서 다시 render 되는 new 나 추후 페이지에 계속 떠있게됨
			render 'new'


		end


	end



	def destroy #log out - stop sesssion state:logout 으로
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end
