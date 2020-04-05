class CreateDocument < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.text :text, null: false

      t.timestamps
    end
  end
end
