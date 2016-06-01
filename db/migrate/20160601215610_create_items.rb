class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.boolean :like
      t.boolean :complete
      t.string :type
      t.belongs_to :list

      t.timestamps null: false
    end
  end
end
