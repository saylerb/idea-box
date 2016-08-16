class Api::V1::IdeasController < Api::V1::ApiBaseController
  def index
    render json: Idea.all
  end
end
