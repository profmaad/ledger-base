$:.push File.expand_path('../lib', __FILE__)
require 'ledger-base/version.rb'

Gem::Specification.new do |s|
  s.name = 'ledger-base'
  s.version = LedgerBase.version_string
  s.date = Time.now.strftime('%Y-%m-%d')
  s.summary = 'Basic tools for working with the ledger accounting system in ruby'
  s.description = 'ledger-base is a collection of tools/classes to handle certain common tasks when working with the ledger accounting system from ruby'
  s.authors = ['Maximilian Wolter']
  s.email = 'himself at prof-maad dot org'
  s.license = 'MIT'

  s.add_runtime_dependency 'trollop', '>= 2.0'
  s.add_runtime_dependency 'deep_merge', '>= 1.0.0'

  s.files = %x(git ls-files).split("\n")
  s.executables = %x(git ls-files -- bin/*).split("\n").map {|f| File.basename(f)}
end
