# Name::      Sysadmin::FileExtension
# Author::    774 <http://id774.net>
# Created::   Jul 17, 2012
# Updated::   Jul 17, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  module FileExtension
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

    def File.append_line(file, str)
      if File.exist?(file)
        f = open(file, 'a')
      else
        f = open(file, 'w')
      end
      f << str
      f << "\n"
      f.close
    end

    def File.new_line(file, str)
      f = open(file, 'w')
      f << str
      f << "\n"
      f.close
    end

    def File.replace_line(file, src, out)
      open(file, "r+") { |f|
        f.rewind
        body = f.read
        body = body.gsub(src) { |tmp|
          out
        }
        f.rewind
        f.puts body
        f.truncate(f.tell)
      }
    end

    def File.remove_line(file, str)
      out = ""
      IO.foreach(file) { |line|
        out << line unless line.include?(str)
      }
      open(file, "w") { |f|
        f.write out
      }
    end

  end
end
