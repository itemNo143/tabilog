# == Schema Information
#
# Table name: travel_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  travel_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_travel_users_on_travel_id  (travel_id)
#  index_travel_users_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (travel_id => travels.id)
#  fk_rails_...  (user_id => users.id)
#
class TravelUser < ApplicationRecord
  belongs_to :travel
  belongs_to :user
end
