class Page
	def initialize
		@browser = Driver.instance.browser
		@wait = Driver.instance.wait
	end
	
	def displayed_title
		return @browser.title
	end
	
	def close_browser
		Driver.instance.close		
	end
	
	def has_alert(*message)
		if message.length == 0
			 @browser.find_element(:xpath, "//div[starts-with(@class, 'alert')]").displayed?
		elsif message.length == 1
			 @browser.find_element(:xpath, "//div[starts-with(@class, 'alert') and text()='"+ message[0] + "']").displayed? 
		end
	end
	
	def has_browser_alert(*message)
		if message.length == 0
			get_browser_alert
		elsif message.length == 1
			@wait.until {get_browser_alert}
			get_browser_alert_text.include? message[0]
		end
	end	
	
	def get_browser_alert_text
		return get_browser_alert.text
	end
	
	def accept_browser_alert
		@wait.until {get_browser_alert}
		get_browser_alert.accept
	end
	
	def get_browser_alert
		@browser.switch_to.alert rescue false
	end
	
	def made_visible(element)
		change_attr("style", "visibility:visible", element)
	end
	
	def change_attr(attr, value, element)
		script = "arguments[0].setAttribute(arguments[1], arguments[2]);"
		@browser.execute_script(script, element, attr, value)
	end
	
	def find(element)
		@wait.until {@browser.find_element(element)}
		return @browser.find_element(element)
	end
	
	def select_option(locator, value)
		selected = @browser.find_element(locator).find_elements(:tag_name, "option").detect {|option| option.attribute('text').eql? value}
		selected.click
	end
end