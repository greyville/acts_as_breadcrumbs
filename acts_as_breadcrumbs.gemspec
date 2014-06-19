# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name          = 'acts_as_breadcrumbs'
  s.version       = '1.0.0'
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Flinn Mueller', 'Oliver Beddows']
  s.email         = ['oliver.beddows@gmail.com']
  s.homepage      = 'https://github.com/karmacoma/acts_as_breadcrumbs'
  s.summary       = 'This plugin uses an acts_as_tree model and creates a breadcrumbs trail attribute using a base attribute.'
  s.description   = 'This plugin uses an acts_as_tree model and creates a breadcrumbs trail attribute using a base attribute.'
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
end
