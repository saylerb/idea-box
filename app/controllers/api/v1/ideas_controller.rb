class Api::V1::IdeasController < Api::V1::ApiBaseController
  def index
    render json: Idea.all
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      render json: idea, status: 201
    else
      render json: idea.errors, status: 422
    end
  end

  def destroy
    idea = Idea.find(params[:id]).destroy
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end
end
