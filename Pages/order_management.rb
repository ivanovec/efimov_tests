class OrderManagement < LoggedPage
	include MenuDispatcher
	
	URL = "#{BASE_URL}/order_releases"
	UPLOAD_INPUT  = { css: 'input#upload_input'   }	
	UPLOAD_FORM   =	{ css: 'div.system'			  } 
	ORDERS_COUNT  = { xpath: '//div[text()[contains(., "Orders total count:")]]' }
	attr_reader :orders_count_prev

	def upload_orders(file)
		@orders_count_prev = get_orders_count
		@csv_last = CSV.new(file).to_a
		show_upload_form
		fill_upload file
		@wait.until {has_alert} if !has_browser_alert
	end
	
	def get_last_csv_rows_count
		return @csv_last.length
	end
	
	def get_orders_count
		return find(ORDERS_COUNT).text.split(':')[1].delete(' ').to_i
	end
	
	private	
	def fill_upload(file)
		find(UPLOAD_INPUT).send_keys file
	end
	
	def show_upload_form
		made_visible find(UPLOAD_FORM)
	end
end	