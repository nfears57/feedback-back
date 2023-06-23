class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :admin, null: false, foreign_key: true
      t.string :result

      t.timestamps
    end
  end
end
