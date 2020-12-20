class Pokemon < ApplicationRecord
  has_many :favorites, dependent: :destroy

  # def self.sort(selection)
  #   case selection
  #   when 'likes'
  #     return find(Favorite.group(:pokemon_id).order(Arel.sql('count(pokemon_id) desc')).pluck(:pokemon_id))
  #   when 'dislikes'
  #     return find(Favorite.group(:pokemon_id).order(Arel.sql('count(pokemon_id) asc')).pluck(:pokemon_id))
  #   end
  # end
end
