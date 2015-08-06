class CreateMemorable < ActiveRecord::Migration
  def change
    create_table :memorables do |t|
      t.string :title
      t.string :description
      t.references :memory, index: true
      t.timestamps
    end
  end
end
