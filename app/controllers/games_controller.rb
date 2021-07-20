class GamesController < ApplicationController

  require 'json'
  require 'open-uri'


  def new
    @alphabet = ('a'..'k').to_a
    @letters = @alphabet.sample(10)
  end


  def score
    @word = params["word"]
    @word_split = @word.split
    # @word_split.each do |letter|
    #   if @letters.include?('letter')
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @found_serialized = URI.open(url).read
    @found = JSON.parse(found_serialized)
    @valid_english_word = found[:found]
    binding.pry
  end
end
