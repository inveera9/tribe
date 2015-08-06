class CreateMemory < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :title
      t.string :description
      t.references :user, index: true
      t.timestamps
    end
  end
end
