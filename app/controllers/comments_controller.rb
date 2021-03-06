class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /photos/1/comments
  def index
    @comments = Comment.all
  end

  # GET /photos/1/comments/1
  def show
    
  end

  # GET /photos/1/comments/new
  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new()
  end

  # GET /photos/1/comments/1/edit
  def edit

  end

  # POST /photos/1/comments
  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.photo, hightlight: @comment }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /photos/1/comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.photo, hightlight: @comment }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /photos/1/comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @photo }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @photo = Photo.find(params[:photo_id])
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :user_id, :photo_id)
    end
end
