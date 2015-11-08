class CreateAnswervotes < ActiveRecord::Migration
	
	def change
		create_table :answervotes do |t|
			t.integer :value
			t.integer :answer_id
			t.integer :user_id
			t.timestamps
		end
	end
end
