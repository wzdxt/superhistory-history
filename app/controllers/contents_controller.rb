class ContentsController < ApplicationController
  layout false, :only => :cache
  def cache
    if @content.cache.present?
      doc = Nokogiri.parse @content.cache
      doc.css('script, iframe, frameset, head, style, link').remove
      @cache = doc.to_s
    end
  end
end

