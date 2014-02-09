#!/Users/Gavin/.rvm/rubies/ruby-2.0.0-p247/bin/ruby

Dir[File.dirname(__FILE__) + '/*rb'].each {|file| require file }

world = World.new population: 50
# world = World.new
puts world.spin generations: 30
