class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link
  before_action :set_upvote
  before_action :set_downvote

  def upvote
    @vote = Vote.new(link: @link, user: current_user, direction: 1)

    if @downvote.present?
      @downvote.destroy 
      @link.update_attribute(:score, @link.score + 1)
    elsif @upvote.nil?
      @vote.save 
      @link.update_attribute(:score, @link.score + 1)
    end

    redirect_to links_path
  end

  def downvote
    @vote = Vote.new(link: @link, user: current_user, direction: -1)

    if @upvote.present?
      @upvote.destroy 
      @link.update_attribute(:score, @link.score - 1)
    elsif @downvote.nil?
      @vote.save 
      @link.update_attribute(:score, @link.score - 1)
    end

    redirect_to links_path
  end

  private
    def set_link
      @link = Link.find(params[:link_id])
    end

    def set_upvote
      @upvote = Vote.find_by(link_id: @link.id, user_id: current_user, direction: 1)
    end

    def set_downvote
      @downvote = Vote.find_by(link_id: @link.id, user_id: current_user, direction: -1)
    end
end
