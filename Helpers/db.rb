#used for generate dummy data, because it is faster than db:fixtures:load
class DB
	def self.add_dummy_load
		begin
			con = prepare_connection
			con.transaction do |con|
				order_id = add_dummy_order 2, 1
				rs = con.exec "INSERT INTO loads VALUES (nextval('public.loads_id_seq'), '#{Time.now.strftime('%Y-%m-%d')}', 2, 0, 1, '#{Time.now.strftime('%Y-%m-%d %H:%M:%S.%L')}', '#{Time.now.strftime('%Y-%m-%d %H:%M:%S.%L')}') RETURNING id;"
				con.exec "UPDATE order_releases SET stop_order_number = 1, status = 1, load_id = #{rs[0]['id']}, updated_at = '#{Time.now.strftime('%Y-%m-%d %H:%M:%S.%L')}' WHERE order_releases.id = #{order_id}"
				con.exec "UPDATE loads SET status = 1 WHERE loads.id = #{rs[0]['id']}"
			end
		rescue PG::Error => e
			puts e.message
		ensure
			con.close if con
		end
	end
	
	def self.add_dummy_order(shift, volume)
		rs = exec_sql "INSERT INTO order_releases VALUES (nextval('public.order_releases_id_seq'),'#{Time.now.strftime('%Y-%m-%d')}',#{shift},'Larkin LLC','1','2','NC','US',27603,'3','4','5','NC',28364,'US','699.480.1907',0,'#{Time.now.strftime('%H%M%S%L')}',#{volume},3,0,0,'#{Time.now.strftime('%Y-%m-%d %H:%M:%S.%L')}','#{Time.now.strftime('%Y-%m-%d %H:%M:%S.%L')}',NULL,NULL) RETURNING id;"
		return rs[0]['id']
	end
	
	def self.exec_sql(sql)
		con = prepare_connection
		rs = con.exec sql
		con.close if con
		return rs
	end
	
	def self.prepare_connection
		PG.connect :dbname => DB_NAME, :user => DB_USER, :password => DB_PASSWORD
	end
end