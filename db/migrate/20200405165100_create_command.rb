class CreateCommand < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.belongs_to :document, null: false, foreign_key: true
      t.float :position, null: false, default: 1
      t.string :text, null: false

      t.timestamps
    end
  end
end
