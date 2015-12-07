class OrdersDelivery < LoggedPage
	include DeliveryParameters
	DOWNLOAD_LINK 	= {css: "button#download_routing_list_button"   }
	DELIVERY_TABLE  = {css: "table#orders_delivery_table"  			}
	
	@@delivery_table_id = "orders_delivery_table"
	def self.delivery_table_id
		@@delivery_table_id
	end
	
	def click_download
		find(DOWNLOAD_LINK).click
	end
	
	def wait_file
		@wait.until {file_exist?}
	end
	
	def select_shift(value)
		select_option SHIFT_SELECT, value
	end
	
	private
	def file_exist?
		File.file?(ROUTING_LIST_FILE)
	end
end