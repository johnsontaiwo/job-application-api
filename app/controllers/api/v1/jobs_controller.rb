 require 'pry'
class Api::V1::JobsController < ApplicationController

  before_action :find_user, except: [:show, :destroy]
    
  def new
    @job = Job.new
    render json: @job
  end

  def index
    @jobs = Job.all
    render json: @jobs
  end
      
  def create
    job = get_current_user.job.build(job_params)
    if job.save
    render json: job
    else
    render :json=> { error: 'Signup or Login' }, :status=>422
    end
  end
      
  def show
    @job = Job.find_by(id: params[:id])
    render json: @job
  end

  def update
    @job = Job.find_by(id: params[:id])
    if @job.update_attributes(job_params)
      render json: @job
    else
      render :json=> @job.errors.message, :status=>422
    end
  end
      

  def destroy
    @job = Job.find_by(id: params[:id])
    if @job.destroy
      render json: @job
    else
      render :json=> { error: 'article could not be deleted' }, :status=>422
    end
  end
      
 
  private

  def find_user
    @user = User.find_by(id:  params[:user_id])
  end
  


  def job_params
     params.require(:job).permit(:title, :date_applied, :status, :feedback, :outcome, :company)
  end

end


       


  

