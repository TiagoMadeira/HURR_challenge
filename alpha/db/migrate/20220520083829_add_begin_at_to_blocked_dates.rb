class AddBeginAtToBlockedDates < ActiveRecord::Migration[6.1]
  def change
    add_column :blocked_dates, :begin_at, :date
  end
end
