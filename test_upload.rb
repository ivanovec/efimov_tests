describe "Upload csv file" do
	before(:all) do
		@orders_page = Login.new.login_as DISPATCHER_LOGIN, DISPATCHER_PASSWORD
		@save_page = SaveOrders.new
	end
	after(:all) do
		@orders_page.close_browser
	end
	
	after(:each) do
		@save_page.click_skip if @save_page.displayed_title == PAGE_SAVE_TITLE
		@orders_page.accep_browser_alert if @orders_page.has_browser_alert
	end
	
	context "using correct csv file" do
		it "upload simple csv" do
			@orders_page.upload_orders CSV_SIMPLE
			expect(@orders_page.has_alert(ALERT_UPLOAD_SUCCESS)).to be true
			expect(@orders_page.get_orders_count).to be 
								@orders_page.orders_count_prev+@orders_page.get_last_csv_rows_count
		end
		it "upload csv with incorrect orders" do
			@orders_page.upload_orders CSV_ORDERS
			expect(@save_page.has_alert(ALERT_UPLOAD_WARNINGS)).to be true
			expect(@save_page.get_entires_count).to be CSV_ORDERS_WARNINGS_COUNT
		end
	end
	context "using incorrect csv file" do
		it "has incorrect structure" do
			@orders_page.upload_orders CSV_INVALID
			expect(@save_page.has_alert(ALERT_UPLOAD_WARNINGS)).to be true
		end
		it "has incorrect extension" do
			@orders_page.upload_orders CSV_INVALID_EXT
			expect(@orders_page.has_browser_alert(BROWSER_ALERT_NOT_CSV)).to be true
		end
	end
end