class AddClosedTimeToIssue < ActiveRecord::Migration
  def self.up
    change_table :issues do |t|
      t.datetime :closed_date
    end
  end

  def self.down
    change_table :issues do |t|
      t.remove :closed_date
    end
  end
end
