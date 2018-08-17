class Bug < ApplicationRecord
 belongs_to :user
 belongs_to :project

 validates :project_id , presence: true
 validates :user_id , presence: true
 validates :title , presence: true, uniqueness: true
 validates :types, presence: true
 validates :status, presence: true

  mount_uploader :screenshot ,ImageUploader
end
