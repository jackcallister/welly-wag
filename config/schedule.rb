set :output, Rails.root.join('log', 'cron.log')

every :friday, at: '9am' do
 rake 'users:digests:deliver'
end
