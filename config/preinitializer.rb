begin
  # Require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fallback on doing the resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

def bundle_instruction
  puts "Execute in project directory:"
  puts
  puts "  gem bundle"
  puts
  exit 255
end
