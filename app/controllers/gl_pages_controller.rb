class GlPagesController < ApplicationController
  def home
    @locations = GlPage.all
  end
end
