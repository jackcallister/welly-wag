module VotesHelper

  def vote_form(post)
    if current_user && current_user.can_vote?(post)
      render 'votes/up', post: post
    elsif current_user
      render 'votes/voted'
    else
      render 'votes/up', post: post
    end
  end
end
