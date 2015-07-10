class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.belongs_to :product, index: true
      t.string :attach_id
      t.string "attach_filename"
      t.integer "attach_size"
      t.string "attach_content_type"

      t.timestamps null: false
    end
    add_foreign_key :attachments, :products
  end
end
