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
    options = options.dup
    responsive = options.delete(:responsive) { false }
    if responsive
      content_tag :picture do
        original_filepath = path.sub(/\A\/assets/, '')
        ::RailsResponsiveImages.configuration.image_sizes.each do |size|
          responsive_image_path = image_path("responsive_images_#{size}/#{original_filepath}")
          concat content_tag(:source, '', media: "(max-width: #{size}px)", srcset: responsive_image_path)
        end
        concat image_tag_without_responsiveness(path, options)
      end
    else
      image_tag_without_responsiveness(path, options)
    end
  end

  alias_method_chain :image_tag, :responsiveness
end
