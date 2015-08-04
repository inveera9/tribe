class CreateUserUserRelation < ActiveRecord::Migration
  def change
    create_table :user_user_relations do |t|
    	t.string :user_user_relation
    	t.references :relationship, index: true

    	t.timestamps
    end
  end
end
