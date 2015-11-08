class CreateQuestionvotes < ActiveRecord::Migration
	
	def change
		create_table :questionvotes do |t|
			t.integer :value
			t.integer :question_id
			t.integer :user_id
			t.timestamps
		end
	end
end
