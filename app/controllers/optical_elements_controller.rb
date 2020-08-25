class OpticalElementsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_params, only: [:edit, :update, :destroy, :toggle_flag]

  def index
    @optical_elements = OpticalElement.category_order.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @optical_element = OpticalElement.new
  end

  def create
    @optical_element = current_user.optical_elements.build(optical_element_params)

    if @optical_element.save
      redirect_to optical_elements_path, notice: "已成功新增！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @optical_element.user = current_user

    if @optical_element.update(optical_element_params)
      redirect_to optical_elements_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy

    @optical_element.delete
    redirect_to optical_elements_path, alert:"已刪除此項目！"
  end

  def toggle_flag
    @optical_element.user = current_user

    if @optical_element.flag_at
      @optical_element.flag_at = nil
    else
      @optical_element.flag_at = Time.now
    end

    @optical_element.save!

    render :json => { :message => "ok", :flag_at => @optical_element.flag_at, :id => @optical_element.id }
  end


  private

  def optical_element_params
    params.require(:optical_element).permit(:item_number, :bandwidth, :category_id, :remark, :user_id)
  end

  def find_params
    @optical_element = OpticalElement.find(params[:id])
  end

end
