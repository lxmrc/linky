class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def edit
  end

  def create
    @link = Link.new(link_params)

    if link_params[:title].empty?
      @link.title = MetaInspector.new(@link.destination).best_title
      @link.description = MetaInspector.new(@link.destination).best_description
    end

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  def upvote
    @link.update_attribute(:score, @link.score + 1)
    redirect_to links_url
  end

  def downvote
    @link.update_attribute(:score, @link.score - 1)
    redirect_to links_url
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:destination, :description, :title)
    end
end
