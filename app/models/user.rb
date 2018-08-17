class User < ApplicationRecord
  has_many :sheets
  has_many :bugs, dependent: :destroy
  has_many :user_projects, dependent: :destroy
  has_many :projects,  through: :user_projects


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
