class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.string :text, null: false
      t.string :kind, null: false

      t.timestamps
    end
  end
end
