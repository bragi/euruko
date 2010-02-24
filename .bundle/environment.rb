# DO NOT MODIFY THIS FILE

require 'digest/sha1'
require "rubygems"

module Bundler
  module SharedHelpers

    def default_gemfile
      gemfile = find_gemfile
      gemfile or raise GemfileNotFound, "The default Gemfile was not found"
      Pathname.new(gemfile)
    end

    def in_bundle?
      find_gemfile
    end

  private

    def find_gemfile
      return ENV['BUNDLE_GEMFILE'] if ENV['BUNDLE_GEMFILE']

      previous = nil
      current  = File.expand_path(Dir.pwd)

      until !File.directory?(current) || current == previous
        filename = File.join(current, 'Gemfile')
        return filename if File.file?(filename)
        current, previous = File.expand_path("..", current), current
      end
    end

    def clean_load_path
      # handle 1.9 where system gems are always on the load path
      if defined?(::Gem)
        me = File.expand_path("../../", __FILE__)
        $LOAD_PATH.reject! do |p|
          next if File.expand_path(p).include?(me)
          p != File.dirname(__FILE__) &&
            Gem.path.any? { |gp| p.include?(gp) }
        end
        $LOAD_PATH.uniq!
      end
    end

    def reverse_rubygems_kernel_mixin
      # Disable rubygems' gem activation system
      ::Kernel.class_eval do
        if private_method_defined?(:gem_original_require)
          alias rubygems_require require
          alias require gem_original_require
        end

        undef gem
      end
    end

    def cripple_rubygems(specs)
      reverse_rubygems_kernel_mixin

      executables = specs.map { |s| s.executables }.flatten

     :: Kernel.class_eval do
        private
        def gem(*) ; end
      end
      Gem.source_index # ensure RubyGems is fully loaded

      ::Kernel.send(:define_method, :gem) do |dep, *reqs|
        if executables.include? File.basename(caller.first.split(':').first)
          return
        end
        opts = reqs.last.is_a?(Hash) ? reqs.pop : {}

        unless dep.respond_to?(:name) && dep.respond_to?(:version_requirements)
          dep = Gem::Dependency.new(dep, reqs)
        end

        spec = specs.find  { |s| s.name == dep.name }

        if spec.nil?
          e = Gem::LoadError.new "#{dep.name} is not part of the bundle. Add it to Gemfile."
          e.name = dep.name
          e.version_requirement = dep.version_requirements
          raise e
        elsif dep !~ spec
          e = Gem::LoadError.new "can't activate #{dep}, already activated #{spec.full_name}. " \
                                 "Make sure all dependencies are added to Gemfile."
          e.name = dep.name
          e.version_requirement = dep.version_requirements
          raise e
        end

        true
      end

      # === Following hacks are to improve on the generated bin wrappers ===

      # Yeah, talk about a hack
      source_index_class = (class << Gem::SourceIndex ; self ; end)
      source_index_class.send(:define_method, :from_gems_in) do |*args|
        source_index = Gem::SourceIndex.new
        source_index.spec_dirs = *args
        source_index.add_specs(*specs)
        source_index
      end

      # OMG more hacks
      gem_class = (class << Gem ; self ; end)
      gem_class.send(:define_method, :bin_path) do |name, *args|
        exec_name, *reqs = args

        spec = nil

        if exec_name
          spec = specs.find { |s| s.executables.include?(exec_name) }
          spec or raise Gem::Exception, "can't find executable #{exec_name}"
        else
          spec = specs.find  { |s| s.name == name }
          exec_name = spec.default_executable or raise Gem::Exception, "no default executable for #{spec.full_name}"
        end

        File.join(spec.full_gem_path, spec.bindir, exec_name)
      end
    end

    extend self
  end
end

module Bundler
  LOCKED_BY    = '0.9.7'
  FINGERPRINT  = "85bd2155b8395c1f8473940d42dff9d7fda81112"
  AUTOREQUIRES = {:test=>[["cucumber-rails", false], ["factory_girl", false], ["database_cleaner", false], ["rspec", false], ["capybara", false], ["rspec-rails", false], ["cucumber", false], ["ruby-debug", false]], :default=>[["i18n", false], ["site_meta", false], ["resource_controller", false], ["tmail", false], ["authlogic", false], ["haml", false], ["rake", false], ["paperclip", false], ["pg", false], ["tzinfo", false]]}
  SPECS        = [
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/nokogiri-1.4.1.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/nokogiri-1.4.1/lib", "/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/nokogiri-1.4.1/ext"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/activesupport-2.3.5.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/activesupport-2.3.5/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/builder-2.1.2.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/builder-2.1.2/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/actionmailer-2.3.5.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/actionmailer-2.3.5/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/i18n-0.3.3.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/i18n-0.3.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/json_pure-1.2.0.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/json_pure-1.2.0/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/linecache-0.43.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/linecache-0.43/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/ruby-debug-base-0.10.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/ruby-debug-base-0.10.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/cucumber-rails-0.2.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/cucumber-rails-0.2.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/factory_girl-1.2.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/factory_girl-1.2.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/database_cleaner-0.2.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/database_cleaner-0.2.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/rack-1.0.1.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/rack-1.0.1/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/actionpack-2.3.5.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/actionpack-2.3.5/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/site_meta-0.2.0.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/site_meta-0.2.0/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/rack-test-0.5.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/rack-test-0.5.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/resource_controller-0.6.6.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/resource_controller-0.6.6/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/mime-types-1.15.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/mime-types-1.15/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/tmail-1.2.0.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/tmail-1.2.0/lib", "/Users/bragi/.bundle/ruby/1.8/gems/tmail-1.2.0/ext/tmail"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/authlogic-2.1.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/authlogic-2.1.3/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/selenium-webdriver-0.0.17.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/selenium-webdriver-0.0.17/common/src/rb/lib", "/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/selenium-webdriver-0.0.17/firefox/src/rb/lib", "/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/selenium-webdriver-0.0.17/chrome/src/rb/lib", "/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/selenium-webdriver-0.0.17/jobbie/src/rb/lib", "/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/selenium-webdriver-0.0.17/remote/client/src/rb/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/haml-2.2.17.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/haml-2.2.17/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/diff-lcs-1.1.2.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/diff-lcs-1.1.2/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/rspec-1.3.0.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/rspec-1.3.0/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/culerity-0.2.9.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/culerity-0.2.9/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/capybara-0.2.0.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/capybara-0.2.0/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/rspec-rails-1.3.1.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/rspec-rails-1.3.1/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/polyglot-0.3.0.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/polyglot-0.3.0/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/treetop-1.4.4.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/treetop-1.4.4/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/rake-0.8.7.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/rake-0.8.7/lib"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/ffi-0.6.2.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/ffi-0.6.2/lib", "/Users/bragi/.bundle/ruby/1.8/gems/ffi-0.6.2/ext"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/activerecord-2.3.5.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/activerecord-2.3.5/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/paperclip-2.3.1.1.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/paperclip-2.3.1.1/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/pg-0.8.0.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/pg-0.8.0/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/columnize-0.3.1.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/columnize-0.3.1/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/term-ansicolor-1.0.4.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/term-ansicolor-1.0.4/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/cucumber-0.6.2.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/cucumber-0.6.2/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/activeresource-2.3.5.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/activeresource-2.3.5/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/rails-2.3.5.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/rails-2.3.5/lib"]},
        {:loaded_from=>"/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/specifications/ruby-debug-0.10.3.gemspec", :load_paths=>["/Users/bragi/.rvm/gems/ree-1.8.7-2009.10/gems/ruby-debug-0.10.3/cli"]},
        {:loaded_from=>"/Users/bragi/.bundle/ruby/1.8/specifications/tzinfo-0.3.16.gemspec", :load_paths=>["/Users/bragi/.bundle/ruby/1.8/gems/tzinfo-0.3.16/lib"]},
      ].map do |hash|
    spec = eval(File.read(hash[:loaded_from]), binding, hash[:loaded_from])
    spec.loaded_from = hash[:loaded_from]
    spec.require_paths = hash[:load_paths]
    spec
  end

  extend SharedHelpers

  def self.match_fingerprint
    print = Digest::SHA1.hexdigest(File.read(File.expand_path('../../Gemfile', __FILE__)))
    unless print == FINGERPRINT
      abort 'Gemfile changed since you last locked. Please `bundle lock` to relock.'
    end
  end

  def self.setup(*groups)
    match_fingerprint
    clean_load_path
    cripple_rubygems(SPECS)
    SPECS.each do |spec|
      Gem.loaded_specs[spec.name] = spec
      $LOAD_PATH.unshift(*spec.require_paths)
    end
  end

  def self.require(*groups)
    groups = [:default] if groups.empty?
    groups.each do |group|
      (AUTOREQUIRES[group] || []).each do |file, explicit|
        if explicit
          Kernel.require file
        else
          begin
            Kernel.require file
          rescue LoadError
          end
        end
      end
    end
  end

  # Setup bundle when it's required.
  setup
end
