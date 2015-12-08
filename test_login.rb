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
		
		USERS.each do |user| 
			it "login as a #{user[:role]} with name #{user[:login]}" do
				@opened_page = @page.login_as user[:login], user[:password]
				expect(@opened_page.has_logout_link).to be true
				if user[:role] == "dispatcher"
					expect(@opened_page.displayed_title).to eq(PAGE_ORDERS_TITLE)
				elsif user[:role] == "driver"
					expect(@opened_page.displayed_title).to eq(PAGE_DELIVERY_TITLE)
				end
			end
		end
	end
	
	context "incorrect login" do
		it "empty credentials" do
			@page = @page.login_as "", ""
			expect(@page.has_alert(ALERT_LOGIN_ERROR)).to be true
		end
		
		INCORRECT_INPUTS.each do |input|
			it "incorrect password: #{input}" do
				@page = @page.login_as "dispatcher", input
				expect(@page.has_alert(ALERT_LOGIN_ERROR)).to be true
			end
		end
	end
end