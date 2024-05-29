class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.text :content
      t.boolean :check

      t.timestamps
    end
  end
end
