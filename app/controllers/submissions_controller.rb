class SubmissionsController < ApplicationController
  respond_to :json

  def create
    @submission = current_user.submissions.create(answer_id: params[:answer_id])
    respond_with @submission, except: [:created_at, :updated_at]
  end

end
