module VotesHelper

  def vote_form(resource)
    if current_user && resource.voteable?(current_user)
      render 'votes/up', voteable: resource
    elsif current_user
      render 'votes/voted'
    else
      render 'votes/up', voteable: resource
    end
  end
end
