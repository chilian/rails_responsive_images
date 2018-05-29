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

  # Yields the global configuration to a block.
  #
  # Example:
  #   RailsResponsiveImages::Rails.configure do |config|
  #     config.sizes = [767, 991, 1999]
  #   end
  def self.configure
    yield configuration if block_given?
  end

  def self.reset
    @configuration = nil
  end
end


ActionView::Helpers::AssetTagHelper.module_eval do

  def image_tag_with_responsiveness(path, options = {})
    content_tag :picture do
      original_file = path.sub(/\A\/assets/, '')
      RailsResponsiveImages.configuration.image_sizes.each do |size|
        responsive_image_path = image_path("responsive_images_#{size}/#{original_file}")
        concat content_tag(:source, '', media: "(max-width: #{size}px)", srcset: responsive_image_path)
      end
      concat content_tag(:img, '', src: image_path(original_file))
    end
  end
end
