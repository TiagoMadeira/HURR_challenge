class CreateBlockedDates < ActiveRecord::Migration[6.1]
  def change
    create_table :blocked_dates do |t|
      t.date :begin_at
      t.date :end_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
