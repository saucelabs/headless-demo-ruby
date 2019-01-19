require 'rspec/core/rake_task'
require 'yaml'

def platforms
  YAML.safe_load(IO.read('spec/platforms.yml'))
end

# TODO - add in windows_8_ie once Sample App is fixed
PLATFORMS = platforms.keys

PLATFORMS.each do |platform|
  desc "Run tests in parallel within suite using #{platform}"
  task platform do
    ENV['PLATFORM'] = platform
    system 'parallel_rspec --serialize-stdout  spec/|grep -B2 Took.*seconds'
  end
end

task :default do
  Rake::Task[PLATFORMS.first].execute
end


#
# For Running Sauce Demo
#

@success = true

PLATFORMS.each do |platform|
  task "#{platform}_demo" do
    ENV['PLATFORM'] = platform
    begin
      @result = system 'parallel_rspec --serialize-stdout  spec/|grep -B2 Took.*seconds'
    ensure
      @success &= @result
    end
  end
end

desc "Run multiple platforms simultaneously"
multitask sauce_demo: PLATFORMS.map { |p| "#{p}_demo" } do
  begin
    raise StandardError, "Tests failed!" unless @success
  ensure
    @success &= @result
  end
end
