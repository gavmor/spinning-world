require 'spec_helper'

describe World do
  it 'spins' do
    World.new.should respond_to :spin
  end
end
