class ProjectsController < ApplicationController
  before_filter :not_authenticated, :only => [:show, :create]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @pledge_total_amount = 0
    all_pledges = @project.pledges.all
    all_pledges.each do |p|
      p.breakpoint_id.each do |l|
        l.breakpont.amount += p.amount


      #@pledge_total_amount += p.amount
    end
    
    @breakpoint = @project.breakpoints.all
  if (current_user.id == @project.owner_id)
    @breakpoint = @project.breakpoints.build
    @pledge = @project.pledges.build
  end
  @pledge_total_amount
  end


  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id

      if @project.save
        redirect_to users_path, :notice => "Project created successfully"
      else
        render :new
      end
  end

  def update
    @project = Project.find(params[:id])

      if @project.update_attributes(project_params)
        redirect_to projects_path(@project)
      else
        render :edit
      end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :start_date, :end_date, :goal, :owner_id)
    end


end
