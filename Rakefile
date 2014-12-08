require "bundler/setup"

gemspec = eval(File.read("semverbump.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["semverbump.gemspec"] do
  system "gem build semverbump.gemspec"
end
