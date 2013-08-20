class ThoughtController < ApplicationController
  def index
  	# @thoughts = Thought.all.order('created_at DESC').limit(5)
    @thoughts = Thought.all.sample(5)

    respond_to do |format|
      format.html
      format.json {render :json => @thoughts}
    end
  end

  def random
    @thoughts = Thought.all.sample(70)

    respond_to do |format|
      format.json {render :json => @thoughts}
    end
  end

  def create
  	thought = Thought.new(:text => params[:text])

  	if thought.valid?
  		thought.save
  		redirect_to :action => :index
  	else
  		flash[:error] = "Invalid entry"
  		redirect_to :action => :new
  	end

  end

  def new
  	@thought = Thought.new
  end
end
