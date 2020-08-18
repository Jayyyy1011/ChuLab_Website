class MeetingsController < ApplicationController

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def index
    @meetings = Meeting.date
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.save
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    if @meeting.update(meeting_params)
      redirect_to meetings_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.delete
  end

  def print
    @meetings = Meeting.date
  end

  private

  def meeting_params
    params.require(:meeting).permit(:date, :speaker, :remark, :speaker2)
  end

end
