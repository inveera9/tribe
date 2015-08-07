class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  respond_to :html


  def index

    if params[:tag]
      @memories = Memory.tagged_with(params[:tag]).order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
      @memorables = Memorable.tagged_with(params[:tag]).order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    else
      if  user_signed_in?
        @memories = current_user.memories.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)

      else
        @memories = Memory.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
      end
      respond_with(@memories)
    end
  end

  def new
    @memory = current_user.memories.build
    respond_with(@memory)
  end

  def create
    @memory = current_user.memories.build(memory_params)
    @memory.save
    respond_with(@memory)
  end

  def show
    respond_with(@memory)
  end

  def edit
  end

  def update
    @memory.update(memory_params)
    respond_with(@memory)
  end

  def destroy
    @memory.destroy
    respond_with(@memory)
  end

  private
  def set_memory
    @memory = Memory.find(params[:id])
  end

  def correct_user
    @memory = current_user.memories.find_by(id: params[:id])
    redirect_to memories_path, notice: "not authorized by KK to edit this memory" if @memory.nil?
  end

  def memory_params
    params.require(:memory).permit(:description, :title, :image_description,:tag_list,:images=>[])
  end
end
