class WelcomeController < ApplicationController
  def index
    @adoption= Post.where(category: "Adoption").order('created_at DESC').last
    @found = Post.where(category: "Found").order('created_at DESC').last
    @missing = Post.where(category: "Missing").order('created_at DESC').last
  end
end
