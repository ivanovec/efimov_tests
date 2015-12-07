require 'selenium-webdriver'

class Driver
	include Singleton		
	
	def initialize 
		prepare_driver
	end
	
	def browser
		prepare_driver if @driver == nil
		return @driver
	end
	
	def close
		@driver.close
		@driver = nil
	end
	
	def wait
		return @wait
	end
	
	private
	def prepare_driver
		if DRIVER == :chrome
			Selenium::WebDriver::Chrome::Service.executable_path = CHROME_BINARY
			prefs = {:download => {
					:prompt_for_download => false,
					:default_directory => Dir.pwd}}
		end
		@driver = Selenium::WebDriver.for DRIVER, :prefs => prefs 
		@wait =  Selenium::WebDriver::Wait.new(:timeout => 20)
	end
end