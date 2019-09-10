class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

   protected
   def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password)}
      create_user_with_secret_code if controller_path.eql?("devise/registrations") && action_name.eql?("create")
   end

   private
   def create_user_with_secret_code
     @secret_code = SecretCode.find_by_code(params[:user][:secret_code])
     if @secret_code
        if @secret_code.user
          flash[:error] = 'Secret code already exist with an user.'
          redirect_to new_user_registration_path
        else
          resource = @secret_code.create_user(user_params)
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        end
     else
       flash[:error] = 'Invalid Secret code.'
       redirect_to new_user_registration_path
     end
   end

   #user parameters to create a user
   def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :password)
   end

   # Sign in a user on sign up.
   def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    after_sign_in_path_for(resource) if is_navigational_format?
  end
end
