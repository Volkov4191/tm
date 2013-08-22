FactoryGirl.define do

  factory :user, aliases: [:author, :performer] do |u|
    u.sequence(:email) { |n| "user#{n}@example.com"}
    u.password "password_for_user"
    u.password_confirmation "password_for_user"
  end

  factory :story_comment do
    body 'StoryCommentBody'
    author
    story
  end

  factory :story do
    title 'StoryTitle'
    body 'StoryBody'
    author
    performer
  end

end


