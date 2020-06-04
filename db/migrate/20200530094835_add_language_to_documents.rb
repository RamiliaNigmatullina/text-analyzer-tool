class AddLanguageToDocuments < ActiveRecord::Migration[5.1]
  def change
    add_column :documents, :language, :string
  end
end
