#!/usr/bin/env ruby

require 'sinatra'

configure do
  @@title = "News Box"
  mime_type :json, 'application/json'
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, settings.root+'/views'
  set :public_folder, settings.root+'/public'
end

helpers do
  def partial (template, locals = {})
    template = ('_'+template.to_s).to_sym     # rails partial convension
    erb(template, :layout => false, :locals => locals)
  end
end

get '/' do
require_relative '../lib/news_box'
  news = NewsBox::HackerNews.new
  @articles = news.get_news
  erb :index
end
