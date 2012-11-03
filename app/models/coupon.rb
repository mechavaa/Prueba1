class Coupon < ActiveRecord::Base
  attr_accessible :bizname, :code, :desc, :discount, :token, :url
  #before_save :create_token


 # def to_param
  #	token 
  #end
  
  #private
  #def create_token
  # self.token = SecureRandom.urlsafe_base64
  #end
end
