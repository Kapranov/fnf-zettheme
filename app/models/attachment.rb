class Attachment < ActiveRecord::Base
  belongs_to :product
  attachment :attach
end
