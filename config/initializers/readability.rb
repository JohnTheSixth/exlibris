class Readability

	def initialize(url)
		@token = ENV['TOKEN']
		@url = url
	end

	def grab
		'https://readability.com/api/content/v1/parser?url=' + @url + '&token=' + @token
	end

end

# Readability returns the following key-value pairs:
	# domain: domain of article
	# next_page_id: id number of following page (I think)
	# url: original article url (this is used as the href while "domain" is used as <a> text
	# short_url: Readability's own shortened URL
	# author: article author, sometimes null
	# excerpt: Short sentence or so about the article
	# direction: all appear to be "ltr" (left to right)
	# word_count: total words in the article - used to calculate read time
	# total_pages: not sure; so far, all are 0
	# content: actual content of the page, containing all html
	# date_published: publication date
	# dek: null for many, but when returned seems to be the first sentence in the article
	# lead_image_url: url of title picture, if it exists
	# title: article title
	# rendered_pages: total number of pages in the article