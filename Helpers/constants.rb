module Constants
	PAGE_LOGIN_TITLE	 = "Log in | Larkin LLC"
	PAGE_ORDERS_TITLE 	 = "Order Releases | Larkin LLC"
	PAGE_LOAD_TITLE		 = "Load Planning | Larkin LLC"
	PAGE_DELIVERY_TITLE  = "Orders Delivery | Larkin LLC"
	PAGE_SAVE_TITLE      = "Upload Order Releases | Larkin LLC"
	ALERT_LOGIN_ERROR 	 = "Invalid login/password combination"
	ALERT_UPLOAD_SUCCESS = "Orders were successfully uploaded"
	ALERT_UPLOAD_WARNINGS  = "
        There are some errors. Please click into invalid table cell to fix it:
      "
	BROWSER_ALERT_NOT_CSV = "file is not *.csv"
	BROWSER_ALERT_COMPLETE_LOAD_SUCCESS = "Load has been successfully planned for delivery"
	BROWSER_ALERT_CAPACITY_ERROR = "Not enough capacity"
	
	USERS = [
				{:login => "dispatcher", :password => "dispatcher", :role => "dispatcher"},
				{:login => "ivanov", :password => "ivanov", :role => "driver"},
				{:login => "petrov", :password => "petrov", :role => "driver"},
			]
			
	INCORRECT_INPUTS = [ '123', ' ', '@', '\\', ';']
	
	DISPATCHER_LOGIN	=	"dispatcher"
	DISPATCHER_PASSWORD	=	"dispatcher"
	DRIVER1_LOGIN		=	"ivanov"
	DRIVER1_PASSWORD	= 	"ivanov"
	DRIVER2_LOGIN		=	"petrov"
	DRIVER2_PASSWORD	= 	"petrov"
	
	CSV_SIMPLE = File.join(Dir.pwd, "TestData\\test1.csv")
	CSV_ORDERS = File.join(Dir.pwd, "TestData\\test2.csv")
	CSV_ORDERS_WARNINGS_COUNT = 29
	CSV_INVALID = File.join(Dir.pwd, "TestData\\test3.csv")
	CSV_INVALID_EXT = File.join(Dir.pwd, "TestData\\test4.cs")
	
	ROUTING_LIST_FILE = "#{Dir.pwd}\\download_routing_list.csv"
	
	MORNING = 0
	AFTERNOON = 1
	EVENING = 2
	MAX_LOAD = 1400
end