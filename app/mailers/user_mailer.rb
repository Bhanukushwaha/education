class UserMailer < ApplicationMailer
	def send_email(data)
    @data = data
    mail(to: "rinku@bittern.co", subject: @data[:city])
	end
end
