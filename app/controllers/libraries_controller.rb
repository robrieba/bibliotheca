class LibrariesController < ApplicationController

  before_action :set_library, only: [:show, :edit, :update, :destroy]

  def index
    @libraries = Library.all.page(params[:page]).per(6)
  end

  def show
  end

  def new
    @library = Library.new
  end

  def edit
  end

  def create
    @library = Library.new(library_params)

    if @library.save
      flash[:notice] = "The #{@library.branch}\" branch was saved successfully."
      redirect_to @library
    else
      flash.now[:alert] = "Error! The branch will not save."
      render :new
    end
  end

  def update
    if @library.update(library_params)
      flash[:notice] = "The #{@library.branch}\" branch was updated successfully."
      redirect_to @library
    else
      flash.now[:alert] = "Error! The branch will not save."
      render :edit
    end
  end

  def destroy
    if @library.destroy
      flash[:notice] = "\"The #{@library.branch}\" branch was deleted successfully."
      redirect_to @post.topic
    else
      flash.now[:alert] = "Error! Cannot save the branch."
      render :show
    end
  end

  private

  def set_library
    @library = Library.find(params[:id])
  end

  def set_books
    # if params[:search]
    #   @books = Book.title_or_isbn(params[:search]).page(params[:page]).per(5)
    # else
    #   @books = Library.find(params[:id]).books.page(params[:page]).per(5)
    # end
  end

  def library_params
    params.require(:library).permit(:branch, :description, :image_url, :search, :page)
  end

end
