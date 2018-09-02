class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.create(ideas_params)
    redirect_to idea_path(@idea)
  end

  def show
    @idea = Idea.find(params[:id])
  end
  
  private

    def ideas_params
      params.require(:idea).permit(:body, :title)
    end
end
