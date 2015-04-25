require_relative '../news_box'
require 'yaml'

module NewsBox

  extend self
  CONFIG = YAML.load_file('config/endpoints.yml')['production']

  class HackerNews

    BASE_URL ||= NewsBox::CONFIG['hacker_news']['base_url']
    TOP_STORIES_URL ||= NewsBox::CONFIG['hacker_news']['top_stories_url']
    ITEM_URL ||= NewsBox::CONFIG['hacker_news']['item_url']
    attr_accessor :articles

    def get_news
      top_stories_ids = get_top_stories_ids
      articles = []
      top_stories_ids.first(5).each do |article_id|
        json = get_article_by_id article_id
        articles << NewsBox::Article.new(json)
      end
      articles
    end

    def get_top_stories_ids
      response = RestClient.get TOP_STORIES_URL
      json = JSON.parse(response)
      json
    end

    def get_article_by_id(article_id)
      article = RestClient.get(ITEM_URL % article_id)
      json = JSON.parse(article)
      json
    end

  end

end
