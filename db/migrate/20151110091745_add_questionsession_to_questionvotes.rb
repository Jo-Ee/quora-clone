class AddQuestionsessionToQuestionvotes < ActiveRecord::Migration
	
	def change
		add_column :questionvotes, :questionsession, :string	
	end

end
