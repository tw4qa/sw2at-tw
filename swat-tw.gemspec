Gem::Specification.new do |s|
  s.name        = 'swat-tw'
  s.version     = '0.0.0'
  s.date        = '2014-11-20'
  s.summary     = 'Swat'
  s.description = 'Tool for end-to-end tests'
  s.authors     = ['Vitaly Tarasenko']
  s.email       = 'vetal.tarasenko@gmail.com'
  s.files       = ['lib/swat_tw.rb']

  s.add_dependency('swat-capybara', '~> 0.0.0')
  s.add_dependency('timecop', '~> 0.7.1')

  s.homepage    = 'http://tw.coming.soon'
  s.license     = 'MIT'
end