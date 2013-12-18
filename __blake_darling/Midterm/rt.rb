# require 'rubygems'
# require 'rottentomatoes'
# include RottenTomatoes

# class RottenTomatoes
# 	attr_accessor :movies

require 'json'
require 'rest-client'

class MovieInfo
	attr_accessor :title

	def initialize
		@title = []	
	end

	def play
		puts "Welcome to RottenCrunchers  Type in a movie title, and RottenCruncher will return the average of the audience rating and the critics rating."
		puts "Enter your movie below!"
		answer = gets.strip
		answer = answer.gsub " ", "+"
		@title = "#{answer}"
		get_from_rotten_tomatoes
	end

	def get_from_rotten_tomatoes
		response = RestClient.get("http://api.rottentomatoes.com/api/public/v1.0/movies.json?apikey=j8qrvdky4gczaaapc6687w3u&q=#{title}&page_limit=1")
		parsed_movie = JSON.parse(response)
			#gets everything from RottenTomatoes

		parsed_movie["movies"].each do |critics_score| 
			@critics_score = critics_score["ratings"]["critics_score"]
			#gets Critic Score

		parsed_movie["movies"].each do |audience_score| 
			@audience_score = audience_score["ratings"]["audience_score"]
			#gets Audience Score

		@audience_score.to_i
		@critics_score.to_i

		average = (@audience_score + @critics_score) / 2
		average.to_s
		puts average
		end

	end

	end
end

