class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.references :user

      t.timestamps null: false
    end
  end
end
