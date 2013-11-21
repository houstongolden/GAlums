class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :proj_name
      t.string :proj_url
      t.string :proj_github

      t.timestamps
    end
  end
end
