class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  protected

  def set_project
    @project = Project.find(params[:project_id])
  end

  def project_owner?
    unless @project.owner == current_user
      redirect_to root_path, alert: "You don't have access to that project."
    end
  end
end
