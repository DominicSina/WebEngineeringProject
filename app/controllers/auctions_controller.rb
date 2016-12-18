class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]

  # GET /auctions
  # GET /auctions.json
  def index
    if(params[:user_id])
      @auctions = User.find(params[:user_id]).auctions
    else
      @auctions = Auction.all
    end
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
    authorize @auction
  end

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = @current_user.auctions.new(auction_params)
    @auction.active=true;

    if params[:auction][:images]
      params[:auction][:images].each do |uploaded_file|
        url=ImgurClient.new.uploadImage uploaded_file
        img=@auction.images.new(imgur_link: url)
      end
    end

    #if params[:auction][:images].length < 1
     # respond_to do |format|
      #  format.html { redirect_to new_auction_path, alert: 'Please upload an image' }
      #end
    #else
      respond_to do |format|
        if @auction.save
          format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
          format.json { render :show, status: :created, location: @auction }
        else
          flash.now[:alert] = @auction.errors
          format.html { render :new}
          format.json { render json: @auction.errors, status: :unprocessable_entity }
        end
      end
    #end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    authorize @auction
    if params[:auction][:images]
      params[:auction][:images].each do |uploaded_file|
        url=ImgurClient.new.uploadImage uploaded_file
        img=@auction.images.new(imgur_link: url)
      end
    end

    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        flash.now[:alert] = @auction.errors
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    authorize @auction
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:name, :description, :active, :end_time)
    end
end
