class CreateGuesses < ActiveRecord::Migration[5.2]
  def change
    create_table :guesses do |t|
      t.references :game

      t.string :guess

      t.timestamps
    end
  end
end
