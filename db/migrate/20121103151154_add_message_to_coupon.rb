class AddMessageToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :message, :string
  end
end
