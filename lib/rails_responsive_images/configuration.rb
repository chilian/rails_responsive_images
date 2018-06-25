module RailsResponsiveImages
  # Stores runtime configuration information.
  #
  # Example settings
  #   RailsResponsiveImages.configure do |c|
  #     c.image_sizes  = [767, 991, 1999]
  #   end
  class Configuration

    # The image_sizes to put into the picture source src attribute
    def image_sizes
      @image_sizes
    end
    def image_sizes=(new_sizes)
      @image_sizes = new_sizes
    end

    # Set default settings
    def initialize
      @image_sizes = [360, 576, 768, 992, 1200, 1600]
    end
  end
end
