Dir['../lib/*.rb'].each { |f| require_relative(f) }
require 'optparse'

def parse_option
  parse = Array.new
  parse[0] = Array.new
  parse[1] = Array.new

  OptionParser.new do |opts|
    opts.banner = "Usage: example.rb [options] devise '~>2.0.0'"
    opts.on('-h', '--help', 'Show help') do
      puts opts
      exit
    end
  end.parse!
end

if ARGV.size < 2
  raise ArgumentError, 'Not enough arguments!'
end

parse_option
name = ARGV[0]
conditions = ARGV[1..-1]


text_string = Checker.new.check_name_version(name, conditions)

if text_string.length != 0
  raise ArgumentError, text_string
end

versions = VersionFetcher.new.fetch(name)
hash = VersionFilter.new.filter(versions, conditions)
Visualizer.new.visualize(hash, name)
