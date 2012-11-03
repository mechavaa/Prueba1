class Coupon < ActiveRecord::Base
  attr_accessible :business_id, :code, :desc, :discount, :token
  before_save :create_token
  belongs_to :business


  # def to_param
  # 	token 
  # end

  private
  def create_token
    self.token = SecureRandom.urlsafe_base64
  end
end
