class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit]

  def index
    # @movies = Movie.all
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def update
    @list.update(list_params)
    # @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'Your list was created!'
    else
      render :new
    end
  end

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
