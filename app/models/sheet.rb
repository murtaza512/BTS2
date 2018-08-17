class Sheet < ApplicationRecord
  belongs_to :user
  mount_uploaders :image ,SheetUploader
  serialize :image, JSON
end
