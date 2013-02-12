class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :name

      t.timestamps
    end
  end
end
