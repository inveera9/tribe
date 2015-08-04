class CreateTribe < ActiveRecord::Migration
  def change
    create_table :tribes do |t|
    	t.string :tribe_name
    	t.string :description
    	t.references :user, index: true

      	t.timestamps
    end
  end
end
