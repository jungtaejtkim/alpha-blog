module ApplicationHelper
	def gravatar_for(user, options = { size: 80})
	  gravatar_id = Digest::MD5::hexdigest(user.email.downcase) # gravatar 에서 제공하는 md5 기반의 해쉬 
	  size = options[:size]
	  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}" 
	  image_tag(gravatar_url, alt:user.username, class: "img-circle")  # << 부트스트랩이 제공하는 클래스    	
	end

end
