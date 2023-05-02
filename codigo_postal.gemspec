Gem::Specification.new do |s|
  s.name          = "codigo_postal"
  s.version       = "0.0.1"
  s.authors       = ["Felipe Mesquita"]
  s.email         = "felipemesquita@hey.com"
  s.summary       = %q{A gem to find Brazilian states by postal code}
  s.description   = %q{This gem provides a simple way to find Brazilian states by postal code.}
  s.homepage      = "https://github.com/felipedmesquita/codigo-postal"
  s.license       = "MIT"

  s.files         = Dir["lib/**/*"]
  s.test_files    = Dir["test/**/*"]

  s.add_development_dependency "minitest", "~> 5.0"
end
