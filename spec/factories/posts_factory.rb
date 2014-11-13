FactoryGirl.define do
	factory :post do
		sequence :title do |n|
			"Sleep Timer pt#{n}"
		end
		date Date.today
	end
end