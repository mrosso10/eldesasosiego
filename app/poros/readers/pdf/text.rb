# frozen_string_literal: true

module Readers
  module Pdf
    class Text < Base
      def text
        reader = PDF::Reader.new(file)
        reader.pages.join("\n")
      end
    end
  end
end
