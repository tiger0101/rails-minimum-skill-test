class Users::RegistrationsController < Devise::RegistrationsController

  # # GET /resource/sign_up
  # def new
  #   super
  # end
  #
  # # POST /resource
  # def create
  #   super
  # end
  #
  # # GET /resource/edit
  # def edit
  #   render :edit
  # end
  #
  # # PUT /resource
  # # We need to use a copy of the resource because we don't want to change
  # # the current user in place.
  # def update
  #   super
  # end
  #
  # # DELETE /resource
  # def destroy
  #   super
  # end
  #
  # # GET /resource/cancel
  # # Forces the session data which is usually expired after sign
  # # in to be expired now. This is useful if the user wants to
  # # cancel oauth signing in/up in the middle of the process,
  # # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # # Signs in a user on sign up. You can overwrite this method in your own
  # # RegistrationsController.
  # def sign_up(resource_name, resource)
  #   sign_in(resource_name, resource)
  # end
  #
  # # The path used after sign up. You need to overwrite this method
  # # in your own RegistrationsController.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource)
  end
  #
  # # The path used after sign up for inactive accounts. You need to overwrite
  # # this method in your own RegistrationsController.
  def after_inactive_sign_up_path_for(resource)
    scope = Devise::Mapping.find_scope!(resource)
    router_name = Devise.mappings[scope].router_name
    context = router_name ? send(router_name) : self
    context.respond_to?(:new_user_session_path) ? context.new_user_session_path : "/"
  end
  #
  # # The default url to be used after updating a resource. You need to overwrite
  # # this method in your own RegistrationsController.
  # def after_update_path_for(resource)
  #   signed_in_root_path(resource)
  # end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
