class PledgesController < ApplicationController
  before_filter :load_project
  before_filter :not_authenticated, :only => [:create]
  def index
  end

  def show
    @pledge = Pledge.find(params[:id])
  end

  def new
    @pledge = Pledge.new
  end

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    @pledge.project = @project

      if @pledge.save
        redirect_to users_path, :notice => "Pledge created successfully"
      else
        render :new
      end
  end


private
  def pledge_params
    params.require(:pledge).permit(:amount, :breakpoint_id, :project_id, :user_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end

  def load_breakpoint
    @breakpoint = Breakpoint.find(params[:breakpoint_id])
  end

end
