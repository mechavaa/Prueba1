class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :bizname
      t.text :desc
      t.string :code
      t.integer :discount

      t.timestamps
    end
  end
end
