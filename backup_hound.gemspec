# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'backup_hound/version'

Gem::Specification.new do |s|
  s.name        = 'backup_hound'
  s.version     = BackupHound::VERSION
  s.authors     = ['Artiom Di']
  s.email       = ['kron82@gmail.com']
  s.homepage    = 'https://github.com/kron4eg/backup_hound'
  s.summary     = %q{Remote backups hound}
  s.description = open('README.md').read

  s.rubyforge_project = 'backup_hound'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # specify any dependencies here; for example:
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rspec'
  s.add_runtime_dependency 'net-ssh'
  s.add_runtime_dependency 'open4'
end
