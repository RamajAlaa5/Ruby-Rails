
class ProductsController < ApplicationController
  http_basic_authenticate_with name: "ramaj", password: "ramaj", except: [:index, :show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(article_params)
    @product.image.attach(article_params[:image])
    if @product.save
      redirect_to products_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])
    @product.image.purge
    @product.image.attach(article_params[:image])
    if @product.update(article_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
     @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, status: :see_other, notice: "deleted successfully"
  end


  private
    def article_params
      params.require(:product).permit(:title, :body, :author, :status, :image)
    end


  end



