#!/usr/bin/ruby

source_files = File.join(File.dirname(__FILE__), 'lib', '*rb')
Dir[source_files].each {|file| require file }

world = World.new population: 50
puts world.spin generations: 30_000
