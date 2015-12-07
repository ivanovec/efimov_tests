BASE_URL= 'http://localhost:3000'
APP_PATH="#{Dir.pwd}/Larkin_LLC_Final"
DRIVER=:chrome
CHROME_BINARY="#{Dir.pwd}/webdriver/chromedriver.exe"
DB_NAME="postgres"
DB_USER="postgres"
DB_PASSWORD="1"

require 'csv'
require 'selenium-webdriver'
require 'pg'
require 'time'
require 'active_support'
require_relative '../Helpers/constants'
require_relative '../Helpers/driver'
require_relative '../Helpers/db'
require_relative '../Pages/menu_dispatcher'
require_relative '../Pages/delivery_parameters'
require_relative '../Pages/page'
require_relative '../Pages/logged_page'
require_relative '../Pages/login'
require_relative '../Pages/order_management'
require_relative '../Pages/load_planning'
require_relative '../Pages/save_orders'
require_relative '../Pages/orders_delivery'

include Constants

