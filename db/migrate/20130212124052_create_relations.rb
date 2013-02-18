class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :relationship
      t.references :sourceFact
      t.references :targetFact

      t.timestamps
    end

    add_index :relations, :sourceFact_id
    add_index :relations, :targetFact_id
  end
end
