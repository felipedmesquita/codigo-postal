[![Gem Version](https://badge.fury.io/rb/codigo_postal.svg)](https://badge.fury.io/rb/codigo_postal)
# CodigoPostal
Validate, format, and get the corresponding Brazilian state for a given CEP without making network requests.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'codigo_postal'
```

And then execute:
```bash
$ bundle install
```

## Usage
```ruby
cep = CodigoPostal.new(1001000)
puts cep.state_code # => 'SP'
puts cep.state_name # => 'São Paulo'
puts cep.to_s # => '01001-000'
```

You can also compare two `CodigoPostal` instances using the `==` operator:
```ruby
cep1 = CodigoPostal.new(4094050)
cep2 = CodigoPostal.new("04.094-050")
puts cep1 == cep2 # => true
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/felipedmesquita/codigo-postal.
Run tests using tldr
```bash
tldr
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
