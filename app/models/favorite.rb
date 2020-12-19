class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates_uniqueness_of :pokemon_id, scope: :user_id
end
