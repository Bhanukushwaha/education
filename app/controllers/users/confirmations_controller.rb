class Users::ConfirmationsController < Devise::ConfirmationsController
	def show
		self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    redirect_to root_path, notice: "Your email address has been successfully confirmed1."
	end
end