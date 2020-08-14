class OpticalElementsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @optical_elements = OpticalElement.all
  end

  def new
    @optical_element = OpticalElement.new
  end

  def create
    @optical_element = OpticalElement.new(optical_element_params)

    if @optical_element.save
      redirect_to optical_elements_path, notice: "已成功新增！"
    else
      render :new
    end
  end

  def edit
    @optical_element = OpticalElement.find(params[:id])
  end

  def update
    @optical_element = OpticalElement.find(params[:id])

    if @optical_element.update(optical_element_params)
      redirect_to optical_elements_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @optical_element = OpticalElement.find(params[:id])

    @optical_element.delete
    redirect_to optical_elements_path, alert:"已刪除此項目！"
  end

  private

  def optical_element_params
    params.require(:optical_element).permit(:item_number, :bandwidth, :category_id, :remark)
  end

end