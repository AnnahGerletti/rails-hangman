class RemoveWordIdColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :word_id
  end
end
