Gem::Specification.new do |s|
  s.name = 'dbiorb'
  s.version = '0.3.0'
  s.date = '2020-06-20'
  s.summary = 'Discord Bio API for Ruby'
  s.description = 'A Ruby library for the Discord Bio (https://discord.bio) API.'
  s.authors = ['Chew']
  s.email = 'chew@chew.pw'
  s.files = Dir['lib/**/*.rb']
  s.homepage = 'https://github.com/Chew/dbiorb'
  s.license = 'MIT'
  s.add_runtime_dependency 'json', '>= 2.0.0'
  s.add_runtime_dependency 'rest-client', '~> 2.1.0'
  s.required_ruby_version = '>= 2.2.4'

  s.metadata = {
    'bug_tracker_uri' => 'https://github.com/Chew/dbiorb/issues',
    'changelog_uri' => 'https://github.com/Chew/dbiorb/releases',
    'homepage_uri' => 'http://github.com/Chew/dbiorb',
    'source_code_uri' => 'http://github.com/Chew/dbiorb',
    'wiki_uri' => 'http://github.com/Chew/dbiorb/wiki',
    'documentation_uri' => 'https://rubydocs.chew.pro/docs/dbiorb'
  }
end
