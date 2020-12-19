class Pokemon < ApplicationRecord
  has_many :favorites, dependent: :destroy
end
