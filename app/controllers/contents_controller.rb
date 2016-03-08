class ContentsController < ApplicationController
  def cache
    @cache = nokogiri_parse(@content.cache).to_s if @content.cache.present?
  end
end
