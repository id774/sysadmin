# Name::      Sysadmin::FileString
# Author::    774 <http://id774.net>
# Created::   Jun 06, 2012
# Updated::   Jun 06, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.


module Sysadmin
  module FileHandler
    require 'zlib'
    Zlib::GZIP_MAGIC = "\x1F\x8B"
    Zlib::GZIP_MAGIC.force_encoding("ASCII-8BIT") if RUBY_VERSION >= "1.9"

    def File.zread(file)
      Object.module_eval do
        open(file) {|f|
          magic = f.read(2)
          f.rewind
          if magic == Zlib::GZIP_MAGIC
            Zlib::GzipReader.wrap(f) {|gz|gz.read}
          else
            f.read
          end
        }
      end
    end
  end
end
