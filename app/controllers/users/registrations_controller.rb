class Users::RegistrationsController < Devise::RegistrationsController
  
  include ItemCollectionsHelper
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
   def create
     @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        defaultCollection("Collection de #{@user.pseudo}",@user.id,@user.created_at)
        sign_in(:user, @user)
        format.html { redirect_to root_path, notice: 'Le compte à correctement été créé' }
        format.json { render :show, status: :created, location: @user }
        #redirect_to root_path
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
   def update
     super
   end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # You can put the params you want to permit in the empty array.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # You can put the params you want to permit in the empty array.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :firstname, :pseudo, :birthdate, :email, :password,:password_confirmation)
    end

end