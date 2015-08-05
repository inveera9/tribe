class CreateMemory < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :title
      t.string :description
      t.string :image_description
      t.references :user, index: true
      t.timestamps
    end
  end
end
