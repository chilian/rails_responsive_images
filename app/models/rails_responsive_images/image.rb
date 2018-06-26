module RailsResponsiveImages
  require 'mini_magick'
  require 'fileutils'
  class Image
    include Singleton

    def create_responsive_folder!(path)
      dirname = File.dirname(path)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
    end

    def generate_responsive_image!(original_image, size, output_path)
      img = MiniMagick::Image.open(original_image)
      img.resize size
      img.write output_path
      img.destroy!
    end
  end
end
