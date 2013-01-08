Gem::Specification.new do |s|
  s.name        = 'guard-spork-minitest'
  s.version     = '0.0.1'
  s.authors     = ['Joseph Hsu', 'Rob Jones']
  s.email       = ['jhsu.x1@gmail.com', 'jonesdeini.spam@gmail.com']
  s.homepage    = 'http://github.com/jhsu/guard-spork-minitest'
  s.summary     = 'Crossbreed guard, spork and minitest.'
  s.description = 'Integrate guard spork and minitest into working properly.'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.0'

  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }

  s.add_dependency 'spork', '~> 0.9.2'
  s.add_dependency 'guard', '~> 1.4.0'
  s.add_dependency 'minitest', '~> 3.3'

  s.add_dependency 'guard-minitest', '~> 0.5'
  s.add_dependency 'guard-spork', '~> 1.2.0'

  s.add_development_dependency 'bundler',     '~> 1.0'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec}/*`.split("\n")
  s.require_path = [ 'lib' ]
end
