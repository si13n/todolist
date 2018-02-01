class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
        @projects = Project.all
    end
 
    def edit
    end

    def show
    end
  
    def create
      @project = Project.new(project_params)
  
      respond_to do |format|
        if @project.save
          format.html { redirect_to projects_url, notice: 'Project was successfully created.' }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :add_new_modal }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
          format.json { render :show, status: :ok, location: @project }
        else
          format.html { render :show }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_project
        @project = Project.find(params[:id])
      end
  
      def project_params
        params.require(:project).permit(:name)
      end
end
