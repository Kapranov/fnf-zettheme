class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.string :avatar_id

      t.timestamps null: false
    end
  end
end
