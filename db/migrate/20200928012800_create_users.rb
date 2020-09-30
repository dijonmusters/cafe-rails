class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :slack_id
      t.string :username
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
