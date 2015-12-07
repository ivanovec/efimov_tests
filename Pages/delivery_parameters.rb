module DeliveryParameters
	DELIVERY_DATE 	= {css: "input#delivery_date_input" 			}
	SHIFT_SELECT  	= {css: "select#load_delivery_shift"  			}
	
	def type_date(date)
		find(DELIVERY_DATE).send_keys [:control, 'a'], :backspace, date, :enter
	end
end