class AddAnswersessionToAnswervotes < ActiveRecord::Migration
	
	def change
		add_column :answervotes, :answersession, :string	
	end

end
