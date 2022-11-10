class UserMailer < ApplicationMailer
	def send_email(data)
    @data = data
    mail(to: "rinku@bitterntec.com", subject: @data[:city])
	end
	def user_status(user)
		@user = user
		mail(to: @user[:email], subject: @user[:first_name])
	end
end
