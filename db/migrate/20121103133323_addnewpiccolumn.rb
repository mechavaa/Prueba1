class Addnewpiccolumn < ActiveRecord::Migration
  def change

	add_column Coupon, :url, :string 

  end

end
