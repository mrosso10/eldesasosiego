# frozen_string_literal: true

module Readers
  module Pdf
    class Image < Base
      def text
        extract_images
        convert_images_to_text
      end

      def temp_files
        Dir.glob("#{Rails.root}/temp_images/**/*")
      end

      def extract_images
        extractor = Extractors::Image.new

        PDF::Reader.open(file) do |reader|
          reader.pages.each do |page|
            extractor.page(page)
          end
        end
      end

      def convert_images_to_text
        temp_files.map do |file|
          RTesseract.new(file).to_s
        end.join("\n")
      end
    end
  end
end
