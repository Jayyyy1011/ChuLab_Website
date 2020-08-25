class ChemicalsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_params, only: [:edit, :update, :destroy, :toggle_flag]

  def index
    @chemicals = Chemical.recent_update.paginate(:page => params[:page], :per_page => 10)

      respond_to do |format|
        format.html
        format.xlsx
      end

  end

  def new
    @chemical = Chemical.new
  end

  def create
    @chemical = current_user.chemicals.build(chemical_params)

    if @chemical.save
      redirect_to chemicals_path, notice: "已成功新增！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @chemical.user = current_user

    if @chemical.update(chemical_params)
      redirect_to chemicals_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @chemical.delete
    redirect_to chemicals_path, alert: "已刪處此藥品！"
  end

  def toggle_flag
    @chemical.user = current_user

    if @chemical.flag_at
      @chemical.flag_at = nil
    else
      @chemical.flag_at = Time.now
    end

    @chemical.save!

    render :json => { :message => "ok", :flag_at => @chemical.flag_at, :id => @chemical.id }
  end

  private

    def chemical_params
      params.require(:chemical).permit(:name, :formula, :nickname, :package, :company, :agent, :storage_place, :remain, :remark, :user_id)
    end

    def find_params
      @chemical = Chemical.find(params[:id])
    end

end
