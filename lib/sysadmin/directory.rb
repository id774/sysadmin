# Name::      Sysadmin::Directory
# Forked from https://gist.github.com/3296137

module Sysadmin
  class Directory
    include Enumerable

    def initialize(dirname)
      @dirname = dirname
      @files = Dir.open(dirname) {|dir|
        dir.reject {|name| name == "." || name == ".." }
      }
    end

    def each(&block)
      if block_given?
        @files.each do |name|
          path = File.join(@dirname, name)
          if File.directory?(path)
            Directory.new(path).each(&block)
          else
            yield path
          end
        end
      else
        Enumerator.new(self, :each)
      end
    end
  end
end
