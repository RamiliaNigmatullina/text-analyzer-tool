class CreateCommandsList < ActiveRecord::Migration[5.1]
  def change
    create_table :commands_lists do |t|
      t.text :commands

      t.timestamps
    end
  end
end
