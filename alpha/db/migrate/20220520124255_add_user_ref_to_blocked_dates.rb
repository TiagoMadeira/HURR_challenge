class AddUserRefToBlockedDates < ActiveRecord::Migration[6.1]
  def change
    add_reference :blocked_dates, :user, null: false, foreign_key: true
  end
end
