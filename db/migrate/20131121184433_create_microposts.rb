class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.references :profile, index: true

      t.timestamps
    end
  end
end
