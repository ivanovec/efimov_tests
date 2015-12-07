describe "dummy load save" do
	before(:all) do
		DB.add_dummy_load
		Login.new.login_as DRIVER1_LOGIN, DRIVER1_PASSWORD
		@delivery_page = OrdersDelivery.new
	end
	after(:all) do
		@delivery_page.close_browser
	end
	
	after(:each) do
		File.delete(ROUTING_LIST_FILE) if File.file?(ROUTING_LIST_FILE)
	end
	context "driver has orders" do
		it "today load" do
			@delivery_page.type_date Time.now.strftime('%m/%d/%Y')
			@delivery_page.select_shift 'evening'
			@delivery_page.click_download
			@delivery_page.wait_file
			expect(File.file?(ROUTING_LIST_FILE)).to be true
		end
	end
end