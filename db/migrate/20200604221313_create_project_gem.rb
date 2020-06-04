class CreateProjectGem < ActiveRecord::Migration[5.1]
  def change
    create_table :project_gems do |t|
      t.belongs_to :document, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
