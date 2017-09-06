class CreateTones < ActiveRecord::Migration[5.1]
  def change
    create_table :tones do |t|
      t.string :mood

      t.timestamps
    end
  end
end
