# frozen_string_literal: true

module Readers
  module Pdf
    class Base
      attr_accessor :file

      def initialize(file)
        self.file = file
      end

      def text
        raise 'Implement this in subclasses'
      end
    end
  end
end
