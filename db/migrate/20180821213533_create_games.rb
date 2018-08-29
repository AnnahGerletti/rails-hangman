class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :word_id
      t.integer :lives
      t.boolean :won_loss 

      t.timestamps
    end
  end
end
