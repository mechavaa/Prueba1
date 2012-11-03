class Coupon < ActiveRecord::Base
  attr_accessible :bizname, :code, :desc, :discount
end
