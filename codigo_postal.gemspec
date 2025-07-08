Gem::Specification.new do |s|
  s.name = "codigo_postal"
  s.version = "0.0.5"
  s.authors = ["Felipe Mesquita"]
  s.email = "felipemesquita@hey.com"
  s.summary = "An offline gem to find Brazilian states by postal code"
  s.description = "Validate, format, and get the corresponding Brazilian state for a given CEP without making network requests."
  s.homepage = "https://github.com/felipedmesquita/codigo-postal"
  s.license = "MIT"

  s.files = Dir["lib/**/*"]

  s.add_development_dependency "tldr", "~> 1.0"
end
