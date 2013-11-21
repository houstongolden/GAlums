class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_email
      t.string :github_url
      t.string :linkedin_url
      t.text :bio

      t.timestamps
    end
  end
end
