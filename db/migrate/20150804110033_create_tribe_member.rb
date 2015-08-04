class CreateTribeMember < ActiveRecord::Migration
  def change
    create_table :tribe_members do |t|
    	t.references :tribe, index: true
    	t.references :user, index: true

    	t.timestamps
    end
  end
end
