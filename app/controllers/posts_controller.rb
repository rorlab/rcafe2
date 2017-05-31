class PostsController < ApplicationController
  before_action :set_bulletin
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :updatable, except: [:show, :index], if: :is_news

  def index
    if @bulletin.present?
      @posts = @bulletin.posts.all
    else
      if params[:tag]
        @posts = Post.tagged_with(params[:tag])
      else
        @posts = Post.all
      end
    end
  end

  def show
  end

  def new
    @post = @bulletin.present? ? @bulletin.posts.new : Post.new
  end

  def edit
  end

  def create
    @post = @bulletin.present? ? @bulletin.posts.new(post_params) : Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to (@bulletin.present? ? bulletin_posts_path(@bulletin) : posts_path), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_bulletin
    @bulletin = Bulletin.find(params[:bulletin_id]) if params[:bulletin_id].present?
  end

  def set_post
    if @bulletin.present?
      @post = @bulletin.posts.find(params[:id])
    else
      @post = Post.find(params[:id])
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :picture, :picture_cache, :tag_list_fixed)
  end

  protected

  def updatable
    if !current_user.admin
      redirect_to bulletin_posts_path(5), notice: "읽기와 목록보기 권한만이 있습니다. "
    end
  end

  def is_news
    # logger.info "Is it the news type? : #{@bulletin.post_type == :news}"
    # logger.info @bulletin.inspect
    @bulletin.post_type_cd == 3
  end
end
