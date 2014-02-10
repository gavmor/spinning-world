require 'spec_helper'

describe Leaderboard do

  describe "#initialize" do
    let(:obj) { described_class.new }
    before do
      obj.initialize
    end

    it 'works'
  end

  describe "#display" do
    let(:obj) { described_class.new }
    before do
      obj.display
    end

    it 'works'
  end
end
