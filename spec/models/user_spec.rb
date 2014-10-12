require 'spec_helper'

describe User, type: :model do
  it_behaves_like "tokenable"
end
