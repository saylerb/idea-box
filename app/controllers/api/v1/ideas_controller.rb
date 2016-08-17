class Api::V1::IdeasController < Api::V1::ApiBaseController
  def index
    render json: Idea.all
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      render json: { idea: idea }, status: 201, location: api_v1_ideas_path(idea)
    else
      render json: { errors: idea.errors }, status: 422, location: api_v1_ideas_path
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :quality)
  end

end
