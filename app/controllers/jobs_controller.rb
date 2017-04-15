class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC") 
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

private

def job_params
  params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
end

end
