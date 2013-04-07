class SchedulesController < ApplicationController
  def index
    @schedules = Schedules.all
  end

  def show
    @schedules = Schedules.find(params[:id])
  end

  def edit
    @schedules = Schedules.find_by_id(params[:id])
  end

  def update
    @schedules = Schedules.find(params[:id])
    if @schedules.save
      flash[:notice] = 'Successfully updated the event!!!'
    end
  end

  def destroy
    @schedules = Schedules.find(params[:id])
    @schedules.destroy
    if @schedules.destroyed?
      flash[:notice] = 'Successfully deleted the event!!!!'
    else
      flash[:error] = 'Could not delete the object'
    end
  end

  def new
    @schedules = Schedules.new()
  end

  def create
    @schedules = Schedules.new(params[:schedules])
    @schedules.save
  end
end