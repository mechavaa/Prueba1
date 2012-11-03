class Coupon < ActiveRecord::Base
  attr_accessible :business_id, :code, :desc, :discount, :token, :url, :message
  belongs_to :business



end
