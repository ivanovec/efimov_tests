describe "Login" do
	before(:all) do
		@page = Login.new
	end
	after(:all) do
		@page.close_browser
	end

	context "correct login" do
		after(:each) do
			@opened_page.logout
			expect(@page.has_login_button).to be true
		end
		
		it "login as a dispatcher" do
			@opened_page = @page.login_as DISPATCHER_LOGIN, DISPATCHER_PASSWORD
			expect(@opened_page.has_logout_link).to be true
			expect(@opened_page.displayed_title).to eq(PAGE_ORDERS_TITLE)
		end
	   
		it "login as a driver" do
			@opened_page = @page.login_as DRIVER1_LOGIN, DRIVER1_PASSWORD
			expect(@opened_page.has_logout_link).to be true
			expect(@opened_page.displayed_title).to eq(PAGE_DELIVERY_TITLE)
		end
	end
	
	context "incorrect login" do
		it "empty credentials" do
			@page = @page.login_as "", ""
			expect(@page.has_alert(ALERT_LOGIN_ERROR)).to be true
		end
		it "incorrect password" do
			@page = @page.login_as "dispatcher", "123"
			expect(@page.has_alert(ALERT_LOGIN_ERROR)).to be true
		end			
	end
end