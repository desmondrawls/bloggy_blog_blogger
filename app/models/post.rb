class Post < ActiveRecord::Base

	def to_html
		return unless self.body
		result = self.body
		count = 1
		while contains_stars(result)
			if count % 2 != 0
				result = result.sub('**', '<strong>')
			else
				result = result.sub('**', '</strong>')
			end
			count += 1
		end
		result
	end

	def contains_stars(text)
		text.include? '**'
	end

end