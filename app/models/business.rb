class Business < ActiveRecord::Base
  attr_accessible :name, :place

  has_many :coupons
end
