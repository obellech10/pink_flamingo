class CreateCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :credentials do |t|
      t.string :uid
      t.string :provider
      t.string :token
      t.references :user, foreign_key: true
    end
  end
end
