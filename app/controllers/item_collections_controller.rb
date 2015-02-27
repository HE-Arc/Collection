class ItemCollectionsController < ApplicationController
  before_action :set_item_collection, only: [:show, :edit, :update, :destroy]

  # GET /item_collections
  # GET /item_collections.json
  def index
    @item_collections = ItemCollection.all
  end

  # GET /item_collections/1
  # GET /item_collections/1.json
  def show
    @item_collection = ItemCollection.find(params[:id])
    @cds = @item_collection.cds
  end

  # GET /item_collections/new
  def new
    @item_collection = ItemCollection.new
  end

  # GET /item_collections/1/edit
  def edit
  end

  # POST /item_collections
  # POST /item_collections.json
  def create
    @item_collection = ItemCollection.new(item_collection_params)

    respond_to do |format|
      if @item_collection.save
        format.html { redirect_to @item_collection, notice: 'Item collection was successfully created.' }
        format.json { render :show, status: :created, location: @item_collection }
      else
        format.html { render :new }
        format.json { render json: @item_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_collections/1
  # PATCH/PUT /item_collections/1.json
  def update
    respond_to do |format|
      if @item_collection.update(item_collection_params)
        format.html { redirect_to @item_collection, notice: 'Item collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_collection }
      else
        format.html { render :edit }
        format.json { render json: @item_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_collections/1
  # DELETE /item_collections/1.json
  def destroy
    @item_collection.destroy
    respond_to do |format|
      format.html { redirect_to item_collections_url, notice: 'Item collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_collection
      @item_collection = ItemCollection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_collection_params
      params.require(:item_collection).permit(:name, :beginDate, :user_id)
    end
end
