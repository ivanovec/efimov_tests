describe "dummy order planning" do
	before(:all) do
		@orders_page = Login.new.login_as DISPATCHER_LOGIN, DISPATCHER_PASSWORD
		@load_page = @orders_page.open_planning
	end
	after(:all) do
		@orders_page.close_browser
	end
		
	after(:each) do
		@load_page.accept_browser_alert if @load_page.has_browser_alert
	end
	
	context "normal total volume" do
		it "add order to morning shift" do
			DB.add_dummy_order(MORNING, 1)
			@load_page.type_date Time.now.strftime('%m/%d/%Y')
			@load_page.select_shift 'morning'
			@load_page.click_reopen if @load_page.get_load_status == "Planned for delivery"
			@load_page.select_first_available_order
			@load_page.click_submit
			expect(@load_page.wait_submited_order_presence_in_table(LoadPlanning.planning_table_id)).to be true
		end
		it "complete load with added order" do
			@load_page.click_complete
			expect(@load_page.has_browser_alert(BROWSER_ALERT_COMPLETE_LOAD_SUCCESS)).to be true
		end
		it "add order to afternoon shift" do
			DB.add_dummy_order(AFTERNOON, 1)
			@load_page.type_date Time.now.strftime('%m/%d/%Y')
			@load_page.select_shift 'afternoon'
			@load_page.click_reopen if @load_page.get_load_status == "Planned for delivery"
			@load_page.select_first_available_order
			@load_page.click_submit
			expect(@load_page.wait_submited_order_presence_in_table(LoadPlanning.planning_table_id)).to be true
		end
		it "complete load with added order" do
			@load_page.click_complete
			expect(@load_page.has_browser_alert(BROWSER_ALERT_COMPLETE_LOAD_SUCCESS)).to be true
		end
		it "add order to evening shift" do
			DB.add_dummy_order(EVENING, 1)
			@load_page.type_date Time.now.strftime('%m/%d/%Y')
			@load_page.select_shift 'evening'
			@load_page.click_reopen if @load_page.get_load_status == "Planned for delivery"
			@load_page.select_first_available_order
			@load_page.click_submit
			expect(@load_page.wait_submited_order_presence_in_table(LoadPlanning.planning_table_id)).to be true
		end
		it "complete load with added order" do
			@load_page.click_complete
			expect(@load_page.has_browser_alert(BROWSER_ALERT_COMPLETE_LOAD_SUCCESS)).to be true
		end		
	end
	context "total volume too big" do
		it "add order to morning shift" do
			DB.add_dummy_order(MORNING, MAX_LOAD+1)
			@load_page.type_date Time.now.strftime('%m/%d/%Y')
			@load_page.select_shift 'morning'
			@load_page.click_reopen if @load_page.get_load_status == "Planned for delivery"
			@load_page.select_first_available_order
			@load_page.click_submit
			expect(@load_page.has_browser_alert(BROWSER_ALERT_CAPACITY_ERROR)).to be true
			@load_page.accept_browser_alert			
		end
		it "complete load with added order" do
			@load_page.click_complete
			expect(@load_page.has_browser_alert(BROWSER_ALERT_CAPACITY_ERROR)).to be true
		end
	end
end