class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :body
      t.string :state
      t.integer :author_id
      t.integer :performer_id

      t.timestamps
    end
  end
end
