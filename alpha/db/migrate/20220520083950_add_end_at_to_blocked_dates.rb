class AddEndAtToBlockedDates < ActiveRecord::Migration[6.1]
  def change
    add_column :blocked_dates, :end_at, :date
  end
end
