#!/usr/bin/env ruby

require_relative '../lib/news_box'

module NewsBox

  extend self

  def main
    news = NewsBox::HackerNews.new
    news.get_news
  end

end

if __FILE__ == $0
  NewsBox.main
end
