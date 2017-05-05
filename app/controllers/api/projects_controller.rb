module Api
  class ProjectsController < ApplicationController

    prepend_before_action :authenticate_user_from_token!

    def index
      @projects = current_user.projects
      render json: @projects
    end

    def show
      @project = Project.find(params[:id])
      render json: @project
    end

    def create
      @project = current_user.projects.new(project_params)

      if @project.save
        render json: { status: :created }
      else
        render json: @project.errors, status: :unprocessable_entity
      end
    end

    private

    def authenticate_user_from_token!
      user_email = params[:user_email].presence
      user = user_email && User.find_by(email: user_email)
      if user && Devise.secure_compare(user.authentication_token, params[:user_token])
        sign_in user, store: true
      else
        render json: { status: "auth failed" }
        false
      end
    end

    def project_params
      params.require(:project).permit(:name, :description, :due_on)
    end
  end
end
