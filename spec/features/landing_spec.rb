require 'spec_helper'

feature "visiting /" do
	let!(:blogpost1) { create(:post) }
	let!(:blogpost2) { create(:post) }

	before do
		visit '/'
	end

	scenario "renders an index of posts", :js => true do
		expect(page).to have_text(blogpost1.title)
		expect(page).to have_text(blogpost1.date)
		expect(page).to have_text(blogpost2.title)
		expect(page).to have_text(blogpost2.date)
	end
end