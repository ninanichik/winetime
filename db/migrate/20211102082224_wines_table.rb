class WinesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :wine_variety
      t.string :produced_year
      t.string :produced_place
      t.references :user
      t.datetime :created_at
    end
  end
end
