source_files = File.join(File.dirname(__FILE__), '..', 'lib', '*rb')

Dir[source_files].each {|file| require file }
