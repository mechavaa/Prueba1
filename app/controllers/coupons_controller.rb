class CouponsController < ApplicationController
  # GET /coupons
  # GET /coupons.json

  before_filter :log_in, :only => [:show]

  def index
    @coupons = Coupon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coupons }
    end
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    
    current_token_id = params[:id]  
    if Coupon.find_by_id(current_token_id)
    @coupon = Coupon.find_by_id(current_token_id)
     if current_user
     current_user.post_wall Coupon.where(:id=>params[:id]).first.message
     #current_user.check_in Coupon.business.place
     end

    else 
    redirect_to root_path # We need to change this is to sorry 404 page
    end
    
  end

  # GET /coupons/new
  # GET /coupons/new.json
  def new
    @coupon = Coupon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coupon }
    end
  end

  # GET /coupons/1/edit
  def edit
    @coupon = Coupon.find_by_token(params[:token])
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(params[:coupon])

    respond_to do |format|
      if @coupon.save
        format.html { redirect_to @coupon, notice: 'Coupon was successfully created.' }
        format.json { render json: @coupon, status: :created, location: @coupon }
      else
        format.html { render action: "new" }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /coupons/1
  # PUT /coupons/1.json
  def update
    @coupon = Coupon.find_by_token(params[:token])

    respond_to do |format|
      if @coupon.update_attributes(params[:coupon])
        format.html { redirect_to @coupon, notice: 'Coupon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @coupon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon = Coupon.find_by_token(params[:token])
    @coupon.destroy

    respond_to do |format|
      format.html { redirect_to coupons_url }
      format.json { head :no_content }
    end
  end

  private

  def log_in
    if !current_user && params[:token]
      session[:coupon_token] = params[:token]
      session[:callback] = true
      redirect_to '/auth/facebook'
    end
  end
end
