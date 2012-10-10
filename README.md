# OmniAuth::GHE

Omniauth Strategy for Github Enterprise installation

## Usage

```ruby
ghe = Class.new(OmniAuth::Strategies::GHE)
ghe.option :name, "example"
ghe.option :url, "https://github.example.com"

use OmniAuth::Builder do
  provider ghe, ENV['EXAMPLE_GITHUB_KEY'], ENV['EXAMPLE_GITHUB_SECRET']
end
```

Or:

```ruby
# lib/omniauth/strategies/example.rb
module OmniAuth::Strategies
  class Example < GHE
    option :url, "https://github.example.com"
  end
end

# app.rb
use OmniAuth::Builder do
  provider :example, ENV['EXAMPLE_GITHUB_KEY'], ENV['EXAMPLE_GITHUB_TOKEN']
end
```

## See Also

* [omniauth-github](https://github.com/intridea/omniauth-github)

## License

Copyright 2012- Tatsuhiko Miyagawa

This software is licensed under the MIT license.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
