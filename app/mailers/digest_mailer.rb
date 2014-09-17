class DigestMailer < ActionMailer::Base
  default from: "news@welly-wag.com"

  def user_digest(user, week_start)
    @user = user
    @posts = Post.where('created_at BETWEEN :start_date AND :end_date',
                        start_date: week_start, end_date: week_start + 7.days).ranked
    @week_start = week_start

    mail(to: @user.email, subject: "Welly Wag Digest for the week of #{week_start.strftime('%b %d, %Y')}")
  end

end
