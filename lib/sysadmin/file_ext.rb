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

    def File.append_line(params)
      if File.exist?(params[:file])
        f = open(params[:file], 'a')
      else
        f = open(params[:file], 'w')
      end
      f << params[:str]
      f << "\n"
      f.close
    end

    def File.new_line(params)
      f = open(params[:file], 'w')
      f << params[:str]
      f << "\n"
      f.close
    end

    def File.replace_line(params)
      open(params[:file], "r+") { |f|
        f.rewind
        body = f.read
        body = body.gsub(params[:src]) { |tmp|
          params[:dst]
        }
        f.rewind
        f.puts body
        f.truncate(f.tell)
      }
    end

    def File.remove_line(params)
      out = ""
      IO.foreach(params[:file]) { |line|
        out << line unless line.include?(params[:str])
      }
      open(params[:file], "w") { |f|
        f.write out
      }
    end

  end
end
