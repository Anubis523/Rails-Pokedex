class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :element_type
      t.integer :weight

      t.timestamps
    end
  end
end
