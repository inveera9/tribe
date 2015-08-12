class MemorablesController < ApplicationController
  before_action :set_memorable, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html


  def index
    page = params[:page]
    per_page = 8
    if  user_signed_in?
      @memory =  current_user.memories.find(params[:memory_id])
      @memorables = @memory.memorables.order("created_at DESC").page(page).per(per_page)

    else
      @memorables = Memorable.all.order("created_at DESC").page(page).per(per_page)
    end
    respond_with(@memorables)
  end

  def new
    @memory = Memory.find(params[:memory_id])
    @memorable = @memory.memorables.build
    respond_with(@memorable)
  end

  def create
    @memory = Memory.find(params[:memory_id])
    @memorable = @memory.memorables.build(memorable_params)
    @memorable.save
    respond_with(@memory,@memorable)
    # redirect_to  memory_memorable_path(@memory.id,@memorable)
  end

  def show
    @memory = Memory.find(params[:memory_id])
    @memorable = @memory.memorables.find(params[:id])
  end

  def edit
  end

  def update
    @memorable.update(memorable_params)
    # respond_with(@memorable)
    redirect_to  memory_memorable_path
  end

  def destroy
    @memorable.destroy
    #respond_with(@memorable)
    redirect_to  memory_memorable_path
  end

  private
  def set_memorable
    @memorable = Memorable.find(params[:id])
  end

  def correct_user
    @memory = Memory.find(params[:memory_id])
    @memorable = @memory.memorables.find_by(id: params[:id])
    redirect_to memory_memorables_path, notice: "not authorized by KK to edit this memorable" if @memorable.nil?
  end

  def memorable_params
    params.require(:memorable).permit(:description, :title, :image_description,:tag_list,:images=>[])
  end
end
