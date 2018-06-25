# Rails responsive images

A Rails `image_tag()` extension to generate HTML5 `<img>` tag using `srcset`. To resize images use the rake task "rake rails_responsive_images".

The following image_tag
```ruby
= image_tag 'awesome/picture.jpeg', alt: 'awesome', responsive: true
```
will generate this output:
```html
<img src="/assets/bcnc-logo-cc37ef86ca5332fd84fa3b7593120c266f1a34cc5c94bd443b07309e38fd97d0.png"
     srcset="/assets/responsive_images_360/picture.png 360w,
             /assets/responsive_images_576/picture.png 576w,
             /assets/responsive_images_768/picture.png 768w,
             /assets/responsive_images_992/picture.png 992w,
             /assets/responsive_images_1200/picture.png 1200w,
             /assets/responsive_images_1600/picture.png 1600w"
>
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
Default is:
```ruby
image_sizes  = [360, 576, 768, 992, 1200, 1600]
```

Add the responsive flag on image_tag helper
```ruby
= image_tag 'awesome/picture.jpeg', alt: 'awesome', responsive: true
```

## Capistrano - Integration
```ruby
before 'deploy:assets:precompile', 'build_responsive_images'
task :build_responsive_images, roles: :app do
  run "cd #{release_path} && RAILS_ENV=#{rails_env} bundle exec rake rails_responsive_images"
end
```

## TODO's & issues
https://github.com/chilian/rails_responsive_images/issues

## Contributing

1. Fork it ( https://github.com/chilian/rails_responsive_images/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Copyright
Copyright © 2015 Christoph Chilian. See LICENSE.txt for further details.
