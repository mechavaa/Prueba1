class Coupon < ActiveRecord::Base
  attr_accessible :business_id, :code, :desc, :discount, :token, :url
  before_save :create_token
  belongs_to :business


end
