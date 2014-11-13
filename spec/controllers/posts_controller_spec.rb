require 'spec_helper'

describe PostsController do
	let!(:blogpost1) { create(:post) }
	let!(:blogpost2) { create(:post) }
	let(:valid_attributes) { attributes_for(:post) }


	describe "#index" do
		it "assigns the posts variable to the Post collection" do
			get :index
			expect(assigns(:posts)).to eq([blogpost1, blogpost2])
		end
	end

	describe "#show" do
		it "assigns the post variable using the params :id" do
			get :show, :id => blogpost1.id
			expect(assigns(:post)).to eq(blogpost1)
		end
	end

	describe "#new" do
		it "assigns a new post to the post variable" do
			get :new
			expect(assigns(:post)).to be_a_new(Post)
		end
	end

	describe "#create" do
		it "creates and saves a new post" do
			expect {
				post :create, post: FactoryGirl.attributes_for(:post)
			}.to change{ Post.count }.from(2).to(3)
			expect(response).to redirect_to(post_path(Post.count))
		end
	end

end