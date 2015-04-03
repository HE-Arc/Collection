class CdsController < ApplicationController
  before_action :set_cd, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def require_permission
    if current_user.id != ItemCollection.find(Cd.find(params[:id]).item_collection_id).user_id
      redirect_to root_path
    end
  end

  # GET /cds
  # GET /cds.json
  def index
    @cds = Cd.all
  end

  # GET /cds/1
  # GET /cds/1.json
  def show
    @tracks = Track.order("track_number").where(cd_id: @cd)
  end

  # GET /cds/new
  def new
    @item_collection_id = params[:item_collection]
    item_collection_param = ItemCollection.find_by_id(@item_collection_id)

    if item_collection_param.nil? || (item_collection_param.user_id != current_user.id)
      flash[:error] = "Vous n'avez pas la permission d'ajouter de CD sur cette collection"
      redirect_to root_path
    end
    @cd = Cd.new
  end

  # GET /cds/1/edit
  def edit
    @cds = Cd.all
  end

  # POST /cds
  # POST /cds.json
  def create
    @cd = Cd.new(cd_params)

    respond_to do |format|
      if @cd.save
        format.html { redirect_to @cd, notice: 'Le CD a été créé avec succès' }
        format.json { render :show, status: :created, location: @cd }
      else
        format.html { render :new }
        format.json { render json: @cd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cds/1
  # PATCH/PUT /cds/1.json
  def update
    respond_to do |format|
      if @cd.update(cd_params)
        format.html { redirect_to @cd, notice: 'Le CD a été mise à jour' }
        format.json { render :show, status: :ok, location: @cd }
      else
        format.html { render :edit }
        format.json { render json: @cd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cds/1
  # DELETE /cds/1.json
  def destroy
    @cd.destroy
    respond_to do |format|
      format.html { redirect_to cds_url, notice: 'Cd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cd
    @cd = Cd.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cd_params
    params.require(:cd).permit(:artist, :name, :editor, :cover, :year, :gender, :purchaseDate, :item_collection_id, :image, :description)
  end
end
