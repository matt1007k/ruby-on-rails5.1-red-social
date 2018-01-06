class MainController < ApplicationController
  def home
    @post = Post.new
    @posts = Post.all
  end
  def unregistered

  end
end
