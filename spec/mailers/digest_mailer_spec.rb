require "spec_helper"

describe DigestMailer, :type => :mailer do

  let(:user) { create(:user) }
  let(:posts) { create_list(:posts, 5) }
  let(:week_start) { 1.week.ago }

  subject { DigestMailer.user_digest(user, week_start) }

  it 'sends an email' do
    expect { subject.deliver }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end

  it 'renders the subject correctly' do
    expect(subject.subject).to eq("Welly Wag Digest for the week of #{week_start.strftime('%b %d, %Y')}")
  end

  it 'sends the email only to the user provided' do
    expect(subject.to).to eq([user.email])
  end

end
