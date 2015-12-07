class SaveOrders < LoggedPage
	PROCEED_BUTTON = { css: 'button#proceed_button' }
	SKIP_BUTTON    = { css: 'a#cancel_upload_button' }
	ENTRIES_COUNT  = { xpath: '//div[text()[contains(., "Showing")]]' }
	
	def get_entires_count
		return find(ENTRIES_COUNT).text.split(' ')[5].to_i
	end
	
	def click_proceed
		find(PROCEED_BUTTON).click
	end
	
	def click_skip
		find(SKIP_BUTTON).click
	end
end