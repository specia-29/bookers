class BooksController < ApplicationController
  def create
    @lists = List.new(list_params)
    if @lists.save
     redirect_to "/books/#{@lists.id}"
    else
      render :index
    end
  end

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/books'
  end


  private
    def list_params
      params.require(:list).permit(:title, :body)
    end
end
