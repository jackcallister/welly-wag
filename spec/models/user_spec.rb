require 'spec_helper'

describe User, type: :model do

  let(:user) { create(:user) }
  let(:post) { create(:post) }

  subject { user }
end
