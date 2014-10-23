class ReaderController < ApplicationController

	before_filter :authorize

	def parse
		if params['read-url'] == ""
			flash[:danger] = "Please enter a valid URL."
			redirect_to root_path
		elsif params['read-url'][0..6] != "http://"
			flash[:danger] = 'Please make sure your URL begins with "http://".'
			redirect_to root_path
		elsif User.find(session[:user_id]).articles.find_by_url(params['read-url']) != nil
			flash[:notice] = "You already have that article in your library."
			article_id = User.find(session[:user_id]).articles.find_by_url(params['read-url']).id
			redirect_to "/reader/#{article_id}"
		else
			url = params['read-url']
			reader_url = Readability.new(url)
			@response = HTTParty.get(reader_url.grab)

			if Article.find_by_url(@response['url']) == nil
				@article = Article.new(domain: @response['domain'], next_page_id: @response['next_page_id'], url: @response['url'],short_url: @response['short_url'], author: @response['author'], excerpt: @response['excerpt'], direction: @response['direction'], word_count: @response['word_count'], total_pages: @response['total_pages'], content: @response['content'], date_published: @response['date_published'], dek: @response['dek'], lead_image_url: @response['lead_image_url'], title: @response['title'], rendered_pages: @response['rendered_pages'], user_id: session[:user_id])				
				@article.save
			elsif Article.find_by_url(@response['url']) != nil
				@article = Article.find_by_url(@response['url'])
			end
		end
 	end

	def save
		redirect_to library_path
	end

	def delete
		
		if params['url'] != nil
			Article.find_by_url(params['url']).delete
		else
			Article.find(params['id']).delete
		end
		
		redirect_to :root

	end

	def checkout
		@article = Article.find(params['id'])
	end

end