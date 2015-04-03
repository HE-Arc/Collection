class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]
  before_filter :require_permission, only: [:edit,:update,:destroy]

  def require_permission
    if current_user.id != User.find(params[:id]).id
      redirect_to root_path
      #Or do something else here
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    if !params[:search].nil? || params[:search] == ''
      t = User.arel_table
      @users = User.where(t[:pseudo].matches("%#{params[:search]}%")).all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @item_collection = ItemCollection.where("user_id = ?",@user.id).first
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "L'utilisateur a été créé avec succès" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "L'utilisateur a été mise à jour" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "L'utilisateur a été correctement détruit." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :firstname, :pseudo, :anonym, :birthdate, :email, :password)
    end
end
