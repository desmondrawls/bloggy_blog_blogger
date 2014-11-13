require 'spec_helper'

feature "visiting /" do
	let!(:blogpost1) { create(:post) }
	let!(:blogpost2) { create(:post) }

	before do
		visit '/'
	end

	scenario "renders an index of posts" do
		expect(page).to have_text(blogpost1.title)
		expect(page).to have_text(blogpost1.date)
		expect(page).to have_text(blogpost2.title)
		expect(page).to have_text(blogpost2.date)
	end

	scenario "links each post to its show page" do
		click_on blogpost1.title
		expect(current_path).to eq(post_path(blogpost1))
		expect(page).to have_text(blogpost1.title)
		expect(page).to have_text(blogpost1.date)
	end

	scenario "creates a new post" do
		click_on "New Post"
		expect(current_path).to eq(new_post_path)
		fill_in 'post[title]', with: "Buffalo Chicken"
		fill_in 'post[date]', with: Date.today
		fill_in 'post[body]', with: "**This is markup, I swear**"
		click_on "Submit"
		expect(current_path).to eq(post_path(Post.last))
		save_and_open_page
		expect(page.html).to include("<strong>This is markup, I swear</strong>")
	end
end