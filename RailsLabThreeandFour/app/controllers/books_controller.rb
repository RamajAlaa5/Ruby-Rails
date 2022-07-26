

  class BooksController < ApplicationController
    before_action :authorized, only:[:api_index]
  
  
    def index
      @books=Book.all.order("id")
    end
    def api_index
      @books=Book.all.order("id")
      render :json => @books ,:root => false
    end 
    def new
      @book=Book.new()
    end
    def create
      @book=current_user.books.build(book_params)
      if @book.save
        redirect_to @book
      else
        render 'new'
      end
    end
    
    def edit
      @book = Book.find(params[:id])
    end 
    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to @book
      else
        render 'edit'
      end
    end

    def show
      @book = Book.find(params[:id])
    end
    def destroy
     Book.find(params[:id]).destroy
     redirect_to articles_path
    end

    private
    def book_params
      params.require(:book).permit(:name, :price)
    end
  end