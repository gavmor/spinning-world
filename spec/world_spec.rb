require 'spec_helper'

describe World do
  before do
    allow(obj).to receive :attr_accessor
    allow(obj).to receive :private
    allow(obj).to receive :attr_accessor
  end

  describe "#initialize" do
    let(:obj) { described_class.new }
    before do
      obj.initialize
    end

    it 'works'
  end

  describe "#advance" do
    let(:obj) { described_class.new }
    before do
      obj.advance
    end

    it 'works'
  end

  describe "#spin" do
    let(:obj) { described_class.new }
    before do
      allow(obj).to receive :stats
      obj.spin
    end
    it "calls #stats" do
      expect(obj).to have_received :stats
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

  describe "#winner" do
    let(:obj) { described_class.new }
    before do
      obj.winner
    end

    it 'works'
  end

  describe "#loser" do
    let(:obj) { described_class.new }
    before do
      obj.loser
    end

    it 'works'
  end

  describe "#remove" do
    let(:obj) { described_class.new }
    before do
      obj.remove
    end

    it 'works'
  end
end
