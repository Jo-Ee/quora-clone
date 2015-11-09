class ChangeAnswervotes < ActiveRecord::Migration
	def up
		change_column :answervotes, :answersession, :string
	end
end
