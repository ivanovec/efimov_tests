class LoggedPage < Page
	LOGOUT_LINK		= { css: 'a[href="/logout"]' }
	
	def has_logout_link
		return find(LOGOUT_LINK).displayed?
	end
	
	def logout
		find(LOGOUT_LINK).click
		return Login.new
	end
end