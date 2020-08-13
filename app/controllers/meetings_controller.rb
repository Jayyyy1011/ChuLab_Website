class MeetingsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to meetings_path, notice: "已成功新增！"
    else
      render :new
    end
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
    redirect_to meetings_path, alert: "已刪除此項目！"
  end

  private

  def meeting_params
    params.require(:meeting).permit(:date, :speaker, :remark)
  end

end
