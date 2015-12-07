module MenuDispatcher
	MANAGEMENT_LINK = { css: 'a[href="/order_releases"]' }
	PLANNING_LINK 	= { css: 'a[href="/load_planning"]'  }
	
	def open_management
		find(MANAGEMENT_LINK).click
		@wait.until { displayed_title == PAGE_ORDERS_TITLE }
		return OrderManagement.new
	end
	def open_planning
		find(PLANNING_LINK).click
		@wait.until { displayed_title == PAGE_LOAD_TITLE }
		return LoadPlanning.new
	end
end