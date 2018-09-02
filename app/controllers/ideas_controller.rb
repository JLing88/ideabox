class IdeasController < ApplicationController

  before_action :set_idea, only: [:destroy, :edit, :update, :show]

  def index
    @ideas = Idea.all
  end

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def create
    @idea = Idea.create!(ideas_params)
    redirect_to idea_path(@idea.id)
  end

  def show
  end

  def edit
  end

  def update
    @idea.update(ideas_params)
    redirect_to idea_path(@idea)
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path
  end

  private

    def ideas_params
      params.require(:idea).permit(:body, :title, :category_id)
    end

    def set_idea
      @idea = Idea.find(params[:id])
    end
end
