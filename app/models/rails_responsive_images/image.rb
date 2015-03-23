module RailsResponsiveImages
  require 'RMagick'
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
      img = ::Magick::Image.read(original_image).first
      img = img.resize_to_fit(size)
      img.write(output_path)
      img.destroy!
    end
  end
end
