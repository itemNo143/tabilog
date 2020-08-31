# == Schema Information
#
# Table name: scraps
#
#  id              :bigint           not null, primary key
#  image           :string(255)      not null
#  memo            :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  scrap_folder_id :bigint
#
# Indexes
#
#  index_scraps_on_scrap_folder_id  (scrap_folder_id)
#
# Foreign Keys
#
#  fk_rails_...  (scrap_folder_id => scrap_folders.id)
#
class Scrap < ApplicationRecord
  belongs_to :scrap_folder
  belongs_to :user

  validates :image, presence: true
end
