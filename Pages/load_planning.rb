class LoadPlanning < LoggedPage
	include MenuDispatcher
	include DeliveryParameters
	
	SUBMIT_LINK	  = {css: "button#submit_orders_button" }
	COMPLETE_LINK = {css: "button#complete_load_button" }
	REOPEN_LINK   = {css: "button#reopen_load_button"   }
	DELIVERY_DATE = {css: "input#delivery_date_input" 	}
	SHIFT_SELECT  = {css: "select#load_delivery_shift"  }
	TRUCK_SELECT  = {css: "select#load_truck"  			}
	ORDERS_TABLE  = {css: "table#available_orders"  	}
	LOADS_TABLE   = {css: "table#planning_orders"  		}
	VOLUME_LABEL  = {css: "label#truck_volume"  		}
	LOAD_STATUS	  = {css: "div#load_status_value"		}
	
	@@available_table_id = "available_orders"
	def self.available_table_id
		@@available_table_id
	end
	@@planning_table_id  = "planning_orders"
	def self.planning_table_id
		@@planning_table_id
	end	
		
	def select_shift(value)
		select_option SHIFT_SELECT, value
		@wait.until {find(VOLUME_LABEL).displayed?}
	end
	
	def click_submit
		find(SUBMIT_LINK).click
		@wait.until {find(VOLUME_LABEL).displayed?}
	end
	
	def click_complete
		find(COMPLETE_LINK).click
		@wait.until {find(VOLUME_LABEL).displayed?}
	end	

	def click_reopen
		find(REOPEN_LINK).click
		accept_browser_alert
		@wait.until {find(VOLUME_LABEL).displayed?}
	end	
	
	def select_truck(value)
		select_option TRUCK_SELECT, value
		@wait.until {find(VOLUME_LABEL).displayed?}
	end
	
	def get_current_load
		find(VOLUME_LABEL).text.to_i
	end
	
	def wait_submited_order_presence_in_table(table_id)
		@wait.until {get_table_for_last_submited_order == table_id}
	end
	
	def select_first_available_order
		@order_id = find(ORDERS_TABLE).find_element(xpath: "//tbody/tr/td/td/input[1]").attribute 'id'
		find(ORDERS_TABLE).find_element(xpath: "//tbody/tr/td/td/input[1]").click
	end
	
	def get_table_for_last_submited_order
		get_table_for_order(@order_id)
	end
	
	def get_table_for_order(id)
		begin
			find({css: "input##{id}"}).find_element(xpath: "../../../../../../table").attribute 'id'
			rescue Selenium::WebDriver::Error::StaleElementReferenceError
			puts 'stale reference error is catched, trying again'
			find({css: "input##{id}"}).find_element(xpath: "../../../../../../table").attribute 'id'
		end
	end
	
	def get_load_status
		find(LOAD_STATUS).text
	end
end