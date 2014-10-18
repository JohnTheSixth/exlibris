class ReaderController < ApplicationController

	before_filter :authorize

	def index
	end

	def parse
		url = params['read-url']
		reader_url = Readability.new(url)
		@response = HTTParty.get(reader_url.find)

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

# 			article_params = {
# 				domain: @response['domain']
# 				#next_page_id: @response['next_page_id']
# 				url: @response['url']
# 				short_url: @response['short_url']
# 				author: @response['author']
# 				excerpt: @response['excerpt']
# 				direction: @response['direction']
# 				word_count: @response['word_count']
# 				total_pages: @response['total_pages']
# 				content: @response['content']
# 				date_published: @response['date_published']
# 				dek: @response['dek']
# 				lead_image_url: @response['lead_image_url']
# 				title: @response['title']
# 				rendered_pages: @response['rendered_pages']
# 			}

# 			Article.new(article_params)
 	end

# 	def view
# 	end

# 	def save

# 		# Simple redirect to show the article now added to the library
# 		# redirect_to :library

# 	end

# 	def delete

# 		# Add logic to delete the record created by the article
# 		redirect_to :root

# 	end

# private

# 	def article_params
# 		params.require(:article).permit(:domain, :url, :short_url, :author, :excerpt, :direction, :word_count, :total_pages, :content, :date_published, :dek, :lead_image_url, :title, :rendered_pages)
# 	end

end