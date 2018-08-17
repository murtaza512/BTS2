class Project < ApplicationRecord
  validates :title , presence: true
  has_many :bugs , dependent: :destroy
  has_many :user_projects , dependent: :destroy
  has_many :users, through: :user_projects
  accepts_nested_attributes_for :user_projects
end
