require_relative 'lib/weather_usa/version'

Gem::Specification.new do |spec|
  spec.name          = "weather_usa"
  spec.version       = WeatherUsa::VERSION
  spec.authors       = ["Micah McCallum"]
  spec.email         = ["micahmccallum@outlook.com"]

  spec.summary       = "A gem to pull weather information from weather.gov"
  spec.homepage      = "https://github.com/micahmccallum/weather_usa.git"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/micahmccallum/weather_usa.git"
  spec.metadata["changelog_uri"] = "https://github.com/micahmccallum/weather_usa.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git. 

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["weather_usa"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.9.0"
  spec.add_development_dependency "pry", "~> 0.13.0"

  spec.add_dependency "geocoder", "~> 1.6.0"
  spec.add_dependency "json-ld", "~> 3.1.0"
  spec.add_dependency "colorize", "~> 0.8.0"
end
