$LOAD_PATH << 'lib'

require 'bigdecimal'
require 'optparse'

require 'yaaib/visual_runner/window'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: visual_runner.rb [options]"

  opts.on("-s seed", "--seed seed", String, "Specify seed to run") do |seed|
    options[:seed] = BigDecimal.new(seed)
  end
end.parse!

random = Random.new(options[:seed] || Random.new_seed)
puts "Running with seed #{random.seed}"
window = YaAIB::VisualRunner::Window.new(1280, 720, random)
window.show
