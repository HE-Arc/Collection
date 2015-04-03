class ItemCollectionsController < ApplicationController
  before_action :set_item_collection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_filter :checkPrivacy, only: [:show]

  def require_permission
    if current_user.id != ItemCollection.find(params[:id]).user_id
      redirect_to root_path
    end
  end

  def checkPrivacy
    if ItemCollection.find(params[:id]).is_private
      if current_user.id != ItemCollection.find(params[:id]).user_id
        redirect_to root_path
      end
    end
  end


  # GET /item_collections
  # GET /item_collections.json
  def index
    @item_collections = ItemCollection.where('is_private=false')
    if !params[:search].nil? || params[:search] == ''
      t = ItemCollection.arel_table
      @item_collections = ItemCollection.where(t[:name].matches("%#{params[:search]}%").and(t[:is_private].eq(false)))
      #@item_collections = ItemCollection.where('name LIKE ? AND is_private=false', "%#{params[:search]}%")
    end
  end

  # GET /item_collections/1
  # GET /item_collections/1.json
  def show
    @item_collection = ItemCollection.find(params[:id])
    if @item_collection.nil?
      redirect_to root_path
    end
    @collection_name=@item_collection.name
    @item_collection_id = @item_collection.id
    @cds = @item_collection.cds

    sort = params[:sort]
    if sort.nil? || sort == ''
      @cds = @cds.order('created_at DESC')
    else
      case sort
        when 'date'
          @cds = @cds.order('created_at')
        when 'dateDesc'
          @cds = @cds.order('created_at DESC')
        when 'name'
          @cds = @cds.order('name')
        when 'nameDesc'
          @cds = @cds.order('name DESC')

        when 'purchaseDate'
          @cds = @cds.order('purchaseDate')
        when 'purchaseDateDesc'
          @cds = @cds.order('purchaseDate DESC')
        else
          @cds = @cds.order('created_at DESC')
      end
    end
  end

  # GET /item_collections/new
  def new
    @item_collection = ItemCollection.new
  end

  # GET /item_collections/1/edit
  def edit
    @item_collection = ItemCollection.find(params[:id])
  end

  # POST /item_collections
  # POST /item_collections.json
  def create
    @item_collection = ItemCollection.new(item_collection_params)

    respond_to do |format|
      if @item_collection.save
        format.html { redirect_to @item_collection, notice: "La collection a été correctement créée" }
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
    @item_collection = ItemCollection.find(params[:id])

    respond_to do |format|
      if @item_collection.update(item_collection_params)
        format.html { redirect_to @item_collection, notice: 'La collection a été mise à jour ' }
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
      format.html { redirect_to item_collections_url, notice: 'La collection a été détruite' }
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
    params.require(:item_collection).permit(:name, :beginDate, :user_id, :is_private)
  end
end
