class ThoughtController < ApplicationController
  def index
  	@thoughts = Thought.all.order('created_at DESC')
  end

  def create
  	thought = Thought.new(text: params[:text])

  	if thought.valid?
  		thought.save
  		redirect_to action: :index
  	else

  	end

  end

  def new
  	@thought = Thought.new
  end
end
