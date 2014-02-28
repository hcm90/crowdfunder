class BreakpointsController < ApplicationController
   before_filter :load_project
  def index
  end

  def show
    @breakpoint = Breakpoint.find(params[:id])
    @pledge = @user.pledges.build
  end

  def new
    @breakpoint = Breakpoint.new
  end

  def edit
    @breakpoint = Breakpoint.find(params[:id])
  end

  def create
    @breakpoint = Breakpoint.new(breakpoint_params)
    @breakpoint.project_id = @project.id

      if @breakpoint.save
        redirect_to projects_path, :notice => "Breakpoint created!"
      else
        render :new
      end
  end

  def update
  end

  def destroy
  end

  private
  def breakpoint_params
    params.require(:breakpoint).permit(:amount, :description, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end
