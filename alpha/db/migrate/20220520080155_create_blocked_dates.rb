class CreateBlockedDates < ActiveRecord::Migration[6.1]
  def change
    create_table :blocked_dates do |t|

      t.timestamps
    end
  end
end
