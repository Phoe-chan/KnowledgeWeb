class AddCharacterIdToRelation < ActiveRecord::Migration
  def change
    add_column :relations, :character_id, :integer
    add_index :relations, :character_id
  end
end
