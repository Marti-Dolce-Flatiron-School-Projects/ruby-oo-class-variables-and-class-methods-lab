# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
#
# song.rb
class Song
  attr_accessor :name, :artist, :genre, :count, :genres, :artists

  @@count = 0
  @@artists = []

  # @return [Integer]
  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @@artists << artist
    @genre = genre
    @@genres << genre
    @@count += 1
  end

  # @return [Integer]
  def self.count
    @@count
  end

  @@genres = []

  # @return [Array]
  def self.genres
    @@genres.uniq
  end

  # @return [Hash]
  def self.genre_count
    genre_count = {}
    @@genres.each do |genre|
      !genre_count[genre] ? genre_count[genre] = 1 : genre_count[genre] += 1
    end
    genre_count
  end

  # @return [Object]
  def self.artist_count
    @@artists.each_with_object(Hash.new(0)) { |i, total| save(i, total)}
  end

  # @return [Array]
  def self.artists
    @@artists.uniq
  end

  protected

  # @return [Integer]
  def self.save(i, total)
    total[i] += 1;
  end
end
