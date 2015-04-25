require_relative 'adapters/hacker_news'
require 'yaml'
require 'rest-client'

module NewsBox

  extend self

  class Article
    attr_accessor :title, :url, :comments

    def initialize arg
      @title = arg['title']
      @url = arg['url']
      @comments = arg['comments']
    end
  end

  class Comment
    attr_accessor :author, :comments, :text, :time
  end

  def get_news
  end

end
