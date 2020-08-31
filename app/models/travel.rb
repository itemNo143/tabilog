# == Schema Information
#
# Table name: travels
#
#  id         :bigint           not null, primary key
#  end_date   :string(255)      not null
#  image      :string(255)
#  name       :string(255)      not null
#  start_date :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Travel < ApplicationRecord
  has_many :scrap_folders, dependent: :destroy
  has_many :travel_users, dependent: :destroy
  has_many :users, through: :travel_users

  with_options presence: true do |admin|
    admin.validates :name
    admin.validates :start_date
    admin.validates :end_date
  end
end
