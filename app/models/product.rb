class Product < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :uploads, dependent: :destroy
  accepts_attachments_for :uploads, attachment: :avatar, append: true
  has_many :properties
  accepts_nested_attributes_for :properties, :reject_if => :all_blank, :allow_destroy => true
  has_many :attachments, dependent: :destroy
  accepts_nested_attributes_for :attachments, :reject_if => :all_blank, :allow_destroy => true
  accepts_attachments_for :attachments, attachment: :attach
  monetize :price
  monetize :cost_price

  validates_associated :uploads
  validates :category_id, :presence => true
  validates :name, :sku, :presence => true
  validates :price, :numericality => true
  validates :cost_price, :numericality => true
end
