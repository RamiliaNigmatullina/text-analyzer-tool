class CreateField < ActiveRecord::Migration[5.1]
  def change
    create_table :fields do |t|
      t.belongs_to :entity, null: false, foreign_key: true
      t.string :name, null: false
      t.string :kind, null: false

      t.timestamps
    end
  end
end
