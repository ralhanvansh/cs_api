class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  self.inheritance_column = :_type_disabled
                                                                              
  validates :name, presence: true, inclusion: { in: %w(Nikon Canon),  message: "Category name can be Nikon or Canon"}, uniqueness: { scope: [:type, :model]}
  validates :type, presence: true, inclusion: { in: ["Mirrorless","full frame","point and shoot"] , message: "%{value} not a valid type" }
  validates :model, presence: true        

end
