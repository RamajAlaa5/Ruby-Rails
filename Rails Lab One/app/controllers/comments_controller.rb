class CommentsController < ApplicationController
  http_basic_authenticate_with name: "ramaj", password: "ramaj", only: :destroy
  def create
    @product = Product.find(params[:article_id])
    @comment = @product.comments.create(comment_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:article_id])
    @comment = @product.comments.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), status: 303
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end


