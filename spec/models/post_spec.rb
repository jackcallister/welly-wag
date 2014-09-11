require 'spec_helper'

describe Post do

  it "has a valid factory" do
    expect(build(:post).valid?).to eq(true)
  end

  it "is invalid without a title" do
    expect(build(:post, title: '').valid?).to eq(false)
  end

  it "is invalid without a url if there is no description" do
    expect(build(:post, url: '', description: '').valid?).to eq(false)
  end

  it "is valid with a url and description" do
    expect(build(:post, url: 'http://google.com', description: 'Test').valid?).to eq(true)
  end

  it "is valid with a url" do
    expect(build(:post, url: 'http://google.com', description: '').valid?).to eq(true)
  end

  it "is valid with a description" do
    expect(build(:post, url: '', description: 'Test').valid?).to eq(true)
  end
end
