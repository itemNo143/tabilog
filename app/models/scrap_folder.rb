# == Schema Information
#
# Table name: scrap_folders
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  travel_id  :bigint
#
# Indexes
#
#  index_scrap_folders_on_travel_id  (travel_id)
#
# Foreign Keys
#
#  fk_rails_...  (travel_id => travels.id)
#
class ScrapFolder < ApplicationRecord
  has_many :scraps, dependent: :destroy
  belongs_to :travel

  validates :name, presence: true

end
