class ContentsController < ApplicationController
  layout false, :only => :cache

  def cache
    @cache = @content.cache
  end
end

