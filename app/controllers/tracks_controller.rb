class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_filter :require_permission, only: [:edit,:update,:destroy]
  
  def require_permission
    if current_user.id != ItemCollection.find(Cd.find(Track.find(params[:id]).cd_id).item_collection_id).user_id
      redirect_to root_path
    end
  end

  # GET /tracks
  # GET /tracks.json
  def index
    @tracks = Track.order("track_number")
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /cds/1/tracks/new
  def new
    cd = Cd.find(params[:cd_id])
    if cd.item_collection_id != get_user_default_collection(current_user.id).id
      return redirect_to root_path
    end
    @track = cd.tracks.build
  end

  # GET /tracks/1/edit
  def edit
    cd = Cd.find(params[:cd_id])
    @track = cd.tracks.find(params[:id])
  end

  # POST /tracks
  # POST /tracks.json
  def create
    cd = Cd.find(params[:cd_id])
    @track = cd.tracks.create(params[:track].permit(:title, :track_number, :cd_id))

    respond_to do |format|
      if @track.save
         format.html { redirect_to(@track.cd, notice: "La piste a été correctement créée") }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to(@track.cd, notice: "La piste a été correctement mise à jour")}
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    @track.destroy
    respond_to do |format|
      format.html { redirect_to(@track.cd, notice: "La piste a été correctement détruite.") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def track_params
      params.require(:track).permit(:title, :track_number, :cd_id)
    end
end
