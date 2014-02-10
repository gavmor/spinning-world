require 'spec_helper'

describe Recollection do
  before do
    allow(obj).to receive :private
  end

  describe "#initialize" do
    let(:obj) { described_class.new }
    before do
      obj.initialize
    end

    it 'works'
  end

  describe "#record" do
    let(:obj) { described_class.new }
    let(:interaction) { double }
    before do
      allow(obj).to receive :log
      obj.record interaction
    end

    it "calls #log" do
      expect(obj).to have_received :log
    end
  end

  describe "#of" do
    let(:obj) { described_class.new }
    before do
      obj.of
    end

    it 'works'
  end
end
