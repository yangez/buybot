class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :team_id
      t.string :user_id
      t.string :team_name
      t.jsonb :webhook_data

      t.timestamps
    end
  end
end
