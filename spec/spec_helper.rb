begin
  require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
rescue LoadError
  puts "You need to install RSpec in your base app"
  exit
end

plugin_spec_dir = File.dirname(__FILE__)
ActiveRecord::Base.logger = Logger.new(plugin_spec_dir + "/debug.log")

databases = YAML::load(IO.read(plugin_spec_dir + "/db/database.yml"))
databases.symbolize_keys!

ActiveRecord::Base.establish_connection(:adapter => databases[:sqlite3][:adapter], :database => databases[:sqlite3][:database])
load(File.join(plugin_spec_dir, "db", "schema.rb"))

RSpec.configure do |c|
  c.fixture_path = plugin_spec_dir + '/fixtures/'
end
