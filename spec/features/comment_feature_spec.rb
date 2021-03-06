require 'spec_helper'

describe "commenting on post" do
  let!(:post) { create(:post1) }
  let!(:user) { create(:user2) }

  it "begins with no comments" do
    visit '/posts'
    expect(page).to have_content '0 comments'
  end

  it "adds comment" do
    visit '/posts'
    click_link 'Add a comment'
    fill_in 'Add a comment', with: 'Super comment'
    click_button 'Add comment'
    expect(page).to have_content '1 comment'
    expect(page).not_to have_content '1 comments'
  end

  it 'displays comments', js: true do
    create(:comment, post: post, user: user)
    visit '/posts'
    click_link '1 comment'
    expect(page).to have_content 'Awesome!'
  end
  it 'displays username in comments', js: true do
    create(:comment, post: post, user: user)
    visit '/posts'
    click_link '1 comment'
    expect(page).to have_css '.comment-author', text: 'user2'
  end

end
