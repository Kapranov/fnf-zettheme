class Upload < ActiveRecord::Base
  belongs_to :product
  attachment :avatar
end
