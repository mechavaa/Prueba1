class AddTokenToCoupons < ActiveRecord::Migration
  def change
    add_column :coupons, :token, :string
  end
end
