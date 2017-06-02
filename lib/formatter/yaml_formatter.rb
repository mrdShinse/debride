module Debride
  module Formatter
    class YamlFormatter < BaseFormatter
      FORMAT = ["  -", super.FORMAT].join('').freeze

      def self.puts(klass, bad)
        puts
        puts "#{klass}:"
        puts bad.join "\n"
      end
    end
  end
end
