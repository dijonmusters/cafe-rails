class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :slack_id
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end
