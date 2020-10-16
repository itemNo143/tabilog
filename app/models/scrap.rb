# == Schema Information
#
# Table name: scraps
#
#  id              :bigint           not null, primary key
#  image           :string(255)      not null
#  latitude        :float(24)
#  longitude       :float(24)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scrap_folder_id :bigint
#  user_id         :bigint
#
# Indexes
#
#  index_scraps_on_scrap_folder_id  (scrap_folder_id)
#  index_scraps_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (scrap_folder_id => scrap_folders.id)
#  fk_rails_...  (user_id => users.id)
#
class Scrap < ApplicationRecord
  belongs_to :scrap_folder
  belongs_to :user

  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
