module Debride
  module Formatter
    class BaseFormatter
      FORMAT = "  %-35s %s".freeze

      def self.do(missing, method_locations, focus)
        missing.each do |klass, meths|
          bad = meths.map do |meth|
            location =
              method_locations["#{klass}##{meth}"] ||
              method_locations["#{klass}::#{meth}"]
            path = location[/(.+):\d+$/, 1]

            next if focus && !File.fnmatch(focus, path)

            FORMAT % [meth, location]
          end
          bad.compact!
          next if bad.empty?

          puts(klass, bad)
        end
      end

      def self.puts(klass, bad)
        puts
        puts klass
        puts bad.join "\n"
      end
    end
  end
end
