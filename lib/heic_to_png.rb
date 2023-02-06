# frozen_string_literal: true

require_relative "heic_to_png/version"

module HeicToPng
  class Error < StandardError; end

  class Main
    require 'mini_magick'

    def convert_to_png(file)
      image = MiniMagick::Image.open(file)
      image.format 'png'
      image.write file.gsub(/heic/i, 'png')
    end

    Dir.glob('*.heic').each do |file|
      convert_to_png(file)
    end
  end
end
