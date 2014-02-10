require 'spec_helper'

describe Denizen do
  describe "#initialize" do
    let(:obj) { described_class.new }

    before do
      obj.initialize
    end
  end

  describe "#react" do
    let(:obj) { described_class.new }
    before do
      obj.react
    end

    it 'works'
  end

  describe "#take" do
    let(:obj) { described_class.new }
    before do
      obj.take
    end

    it 'works'
  end

  describe "#wealth" do
    let(:obj) { described_class.new }
    before do
      obj.wealth
    end

    it 'works'
  end

  describe "#<=>" do
    let(:obj) { described_class.new }
    before do
      obj.<=>
    end

    it 'works'
  end
end
