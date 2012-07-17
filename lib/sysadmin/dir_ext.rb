# Name::      Sysadmin::DirExtension
# Author::    774 <http://id774.net>
# Created::   Jul 17, 2012
# Updated::   Jul 17, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  module DirExtension

    def Dir.filelist(dir, sub_directory = false)
      array = Array.new
      if (FileTest.file?(dir))
        array << dir
      else
        if sub_directory
          dir = dir + "/**/"
        else
          dir = dir + "/"
        end
        Dir::glob(dir).each do |d|
          if (FileTest.directory?(d))
            Dir::foreach(d) do |f|
              if (FileTest.file?(d+f))
                array << d+f
              end
            end
          end
        end
      end
      return array
    end

  end
end
