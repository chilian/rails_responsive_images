module RailsResponsiveImages
  require 'RMagick'
  require 'fileutils'
  class AssetsController < ActionController::Base
    def responsive_image
      filepath = params[:filepath]
      filename = params[:filename]
      format = params[:format]
      image_filename = "#{filename}.#{format}"

      # TODO cleanup
      requested_image_size = filepath.match(/(responsive_images_)\d+/).to_s.split('_').last

      original_filepath = "#{filepath}".sub(/(responsive_images_)\d+/, '/')
        .sub(/\/\//, '') # remove duplicated slashes
        .sub(/\A\//, '') # remove leading slash

      full_original_filepath = Rails.root.join('app', 'assets', 'images', original_filepath, image_filename)
      full_responsive_filepath = Rails.root.join('app', 'assets', 'images', filepath, image_filename)

      create_responsive_folder!(full_responsive_filepath)

      fail ActionController::RoutingError.new('Not found') unless File.exist?(full_original_filepath)

      generate_responsive_image!(full_original_filepath, requested_image_size, full_responsive_filepath)

      mime_type = MIME::Types.type_for("#{full_responsive_filepath}").first.content_type
      send_file full_responsive_filepath, type: mime_type, disposition: :inline
    end

    private

    def create_responsive_folder!(path)
      dirname = File.dirname(path)
      unless File.directory?(dirname)
        FileUtils.mkdir_p(dirname)
      end
    end

    def generate_responsive_image!(original_image, size, output_path)
      img = ::Magick::Image.read(original_image).first
      img = img.resize_to_fit(size, size)
      img.write(output_path)
    end
  end
end
