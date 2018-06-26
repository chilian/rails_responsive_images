require 'action_view'
require 'rails_responsive_images/version'
require 'rails_responsive_images/configuration'
require 'rails_responsive_images/engine'

module RailsResponsiveImages
  def self.configuration
    @configuration ||= RailsResponsiveImages::Configuration.new
  end

  def self.configuration=(new_configuration)
    @configuration = new_configuration
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.reset
    @configuration = nil
  end
end


ActionView::Helpers::AssetTagHelper.module_eval do

  def image_tag_with_responsiveness(source, options = {})
    options = options.symbolize_keys
    check_for_image_tag_errors(options)
    skip_pipeline = options.delete(:skip_pipeline)

    options[:src] = resolve_image_source(source, skip_pipeline)
    original_file = source.sub(/^\/assets/, '')

    options[:srcset] = RailsResponsiveImages.configuration.image_sizes.map do |size|
      src_path = path_to_image("responsive_images_#{size}/#{original_file}", skip_pipeline: skip_pipeline)
      "#{src_path} #{size}w"
    end.join(", ")

    options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
    tag("img", options)
  end
end
