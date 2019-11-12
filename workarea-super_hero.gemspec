$:.push File.expand_path('../lib', __FILE__)

require 'workarea/super_hero/version'

Gem::Specification.new do |s|
  s.name        = 'workarea-super_hero'
  s.version     = Workarea::SuperHero::VERSION
  s.authors     = ['Curt Howard']
  s.email       = ['choward@workarea.com']
  s.homepage    = 'https://github.com/workarea-commerce/workarea-super_hero'
  s.summary     = 'Is it a bird? Is it a plane? No it\'s a sweet hero content block!'
  s.description = 'Advanced hero content block with content positioning, image cropping, mobile sweetness, and video embedding!'
  s.files       = `git ls-files`.split("\n")
  s.license = 'Business Software License'

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'workarea', '~> 3.x'
end
