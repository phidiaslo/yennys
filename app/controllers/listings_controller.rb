class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all.order('created_at DESC').includes(:user)
    #@images = Image.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    set_view_count
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @subcategories = Subcategory.all
  end

  # GET /listings/1/edit
  def edit
    @subcategories = Subcategory.all
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_subcategories
    category = Category.find(params[:category_id])
    @subcategories = category.subcategories.map{|a| [a.name, a.id]}.insert(0, "Select Subcategory")
  end

  def set_view_count
    if user_signed_in?
      if (current_user.id != @listing.user_id) && (current_user.role != 'Admin')
        @listing.increment!(:view_count)
      end
    else
      @listing.increment!(:view_count)
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :processing_time, :view_count, :status, :slug, :user_id, :category_id, :subcategory_id, :location_id)
    end
end
