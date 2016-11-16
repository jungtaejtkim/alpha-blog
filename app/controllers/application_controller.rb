class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  helper_method :current_user, :logged_in?  #뷰에 정의한 써서 유저 로그인여부에 따라 UI 에 변경을 줌

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id] #@currentuser ||= 이 없으면 이미 가지고 있는 정보임에도 불구 계속 db 에 물어볼거니까
  	#접속중 유저의 유저 정보를 알게해주는 메쏘드 
  end


  def logged_in?
  	!!current_user
  	# 유저가 로그인 되어있는지 여부
  end


  def require_user #컨트롤러에서 씀
  	if !logged_in?
  		flash[:danger] = "You must be logged in to perform that action"
  		redirect_to root_path
  	end
  	
  end


end
