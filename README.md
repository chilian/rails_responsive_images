# Rails responsive images

A Rails image_tag() extension to generate HTML5 <picture> tag markup from the W3C HTML Responsive Images Extension Proposal. Dont't care about image resizing, the gem will do the work for you - on the fly ;-) 

```ruby
<picture>
  <source media="(max-width: 766px)" srcset="/assets/responsive_images_766/picture.jpg">
  <source media="(max-width: 990px)" srcset="/assets/responsive_images_990/picture.jpg">
  <source media="(max-width: 200px)" srcset="/assets/responsive_images_200/picture.jpg">
  <img width="2568" height="878" alt="awesome" src="/assets/picture.jpg">
</picture>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_responsive_images'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_responsive_images

## Usage

Configure the size steps you want to create:
```ruby
RailsResponsiveImages.configure do |c|
  c.image_sizes  = [767, 991, 1999]
end
```

Require jquery-picture for cross browser support
```javascript
//= require jquery-picture
```

```ruby
= image_tag 'awesome/picture.jpeg', alt: 'awesome', responsive: true
```
## TODO
- write tests
- write docs
- review & cleanup the code

## Contributing

1. Fork it ( https://github.com/chilian/rails_responsive_images/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright
Copyright © 2015 Christoph Chilian. See LICENSE.txt for further details.
