class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.references :other_user
      t.string :message

      t.timestamps
    end
  end
end
