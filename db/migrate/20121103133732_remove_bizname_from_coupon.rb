class RemoveBiznameFromCoupon < ActiveRecord::Migration
  def up
    remove_column :coupons, :bizname
  end

  def down
    add_column :coupons, :bizname, :string
  end
end
