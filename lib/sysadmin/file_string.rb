# Name::      Sysadmin::FileString
# Author::    774 <http://id774.net>
# Created::   Mar 23, 2012
# Updated::   Mar 24, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  module FileString
    def self.append(file, str)
      if File.exist?(file)
        f = open(file, 'a')
      else
        f = open(file, 'w')
      end
      f << str
      f << "\n"
      f.close
    end

    def self.newfile(file, str)
      f = open(file, 'w')
      f << str
      f << "\n"
      f.close
    end

    def self.replaceFile(f, src, out)
      f.rewind
      body = f.read
      body = body.gsub(src) { |tmp|
        out
      }
      f.rewind
      f.puts body
    end

    def self.replace(file, src, out)
      file.flock(File::LOCK_EX)
      open(file, "r+") { |f|
        replaceFile(f, src, out)
        f.truncate(f.tell)
      }
      file.flock(File::LOCK_UN)
    end

    def self.delete(file, str)
      out = ""
      file.flock(File::LOCK_SH)
      IO.foreach(file) { |line|
        out << line unless line.include?(str)
      }
      file.flock(File::LOCK_EX)
      open(file, "w") { |f|
        f.write out
      }
      file.flock(File::LOCK_UN)
    end
  end
end
