class ChangeTypeCommentInStoryCommentsTable < ActiveRecord::Migration
  def change
    change_column :story_comments, :body, :text
  end
end
