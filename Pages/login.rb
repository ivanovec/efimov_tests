class Login < Page
	URL =  "#{BASE_URL}/login"
	LOGIN_BOX		= {	id:	'session_login'		}
	PASSWORD_BOX	= {	id:	'session_password'	}
	LOGIN_BUTTON	= { name: 'commit'			}
	
	def initialize
		super
		@browser.get URL
	end

	def type_login(value)
		find(LOGIN_BOX).send_keys value
		return self
	end
	
	def type_password(value)
		find(PASSWORD_BOX).send_keys value
		return self
	end
	
	def click_login
		find(LOGIN_BUTTON).click
		return self
	end
	
	def login_as(user, password)
		type_login user
		type_password password
		click_login
		return OrderManagement.new
	end
	
	def has_login_button
		return find(LOGIN_BUTTON).displayed?
	end
end	