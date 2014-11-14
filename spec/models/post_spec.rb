require 'spec_helper'

describe Post do
	before do
		subject.body = "**This is markdown, I swear**"
	end
	
	describe "#to_html" do
		it "should convert ** to strong tags" do
			expect(subject.to_html).to eq('<strong>This is markdown, I swear</strong>')
		end
	end

end
