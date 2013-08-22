class CreateStoryComments < ActiveRecord::Migration
  def change
    create_table :story_comments do |t|
      t.string :body
      t.integer :author_id
      t.references :story, index: true

      t.timestamps
    end
  end
end
