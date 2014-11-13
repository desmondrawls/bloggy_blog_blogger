require 'spec_helper'

describe PostsController do
	let!(:blogpost1) { create(:post) }
	let!(:blogpost2) { create(:post) }

	describe "#index" do
		it "assigns the posts variable to the Post collection" do
			get :index
			expect(assigns(:posts)).to eq([blogpost1, blogpost2])
		end
	end

end