Gem::Specification.new do |s|
  s.name          = "codigo_postal"
  s.version       = "0.0.2"
  s.authors       = ["Felipe Mesquita"]
  s.email         = "felipemesquita@hey.com"
  s.summary       = %q{An offline gem to find Brazilian states by postal code}
  s.description   = %q{Validate, format and get the corresponding Brazilian state for a CEP without making HTTP requests.}
  s.homepage      = "https://github.com/felipedmesquita/codigo-postal"
  s.license       = "MIT"

  s.files         = Dir["lib/**/*"]
  s.test_files    = Dir["test/**/*"]

  s.add_development_dependency "minitest", "~> 5.0"
end
