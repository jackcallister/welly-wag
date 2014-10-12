namespace :users do
  namespace :digests do

    desc "Deliver digest mail to all users for the previous 7 days"
    task :deliver => :environment do
      log_file_name = Rails.root.join("log", "digest_mailer.log")
      @logger = Logger.new(log_file_name)

      User.where(send_digest: true).each do |user|
        DigestMailer.user_digest(user, 7.days.ago).deliver!
        @logger.info "Delivered digest to #{user.email}"
      end
    end

  end
end
