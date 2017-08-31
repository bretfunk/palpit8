class CreateStreams < ActiveRecord::Migration[5.1]
  def change
    create_table :streams do |t|
      t.references :game, foreign_key: true
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
