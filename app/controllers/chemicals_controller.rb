class ChemicalsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @chemicals = Chemical.recent
  end

  def new
    @chemical = Chemical.new
  end

  def create
    @chemical = Chemical.new(chemical_params)
    @chemical.user = current_user

    if @chemical.save
      redirect_to chemicals_path, notice: "已成功新增！"
    else
      render :new
    end
  end

  def edit
    @chemical = Chemical.find(params[:id])
  end

  def update
    @chemical = Chemical.find(params[:id])
    @chemical.user = current_user

    if @chemical.update(chemical_params)
      redirect_to chemicals_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @chemical = Chemical.find(params[:id])
    @chemical.delete
    redirect_to chemicals_path, alert: "已刪處此藥品！"
  end

  private

    def chemical_params
      params.require(:chemical).permit(:name, :formula, :nickname, :package, :company, :agent, :storage_place, :remain, :remark, :user_id)
    end

end
