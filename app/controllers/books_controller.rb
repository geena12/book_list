class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)

    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params["id"])
  end

  def update
    @book = Book.find(params["id"])

    if @book.update(books_params)
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params["id"])
    book.destroy

    redirect_to books_path, notice: "Deleted book #{book.title}"
  end


  private
  def books_params
    params.require(:book).permit(:title, :author, :pages)
  end
end
