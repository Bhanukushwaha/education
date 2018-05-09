class Blog < ApplicationRecord
	mount_uploader :image, UserUploader
end
