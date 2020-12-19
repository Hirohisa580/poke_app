class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.integer   :number,          default: ""
      t.string    :name,            default: ""
      t.string    :type_one,        default: ""
      t.string    :type_two,        default: ""
      t.string    :image_url,       default: nil
      t.timestamps
    end
  end
end
