class WelcomeController < ApplicationController
  def index
    @adoptions= Post.where(category: "Adoption").order('created_at DESC').first(10)
    @founds = Post.where(category: "Found").order('created_at DESC').first(10)
    @missings = Post.where(category: "Missing").order('created_at DESC').first(10)
  end
end
