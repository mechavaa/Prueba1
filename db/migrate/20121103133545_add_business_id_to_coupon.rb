class AddBusinessIdToCoupon < ActiveRecord::Migration
  def change
    add_column :coupons, :business_id, :integer
  end
end
