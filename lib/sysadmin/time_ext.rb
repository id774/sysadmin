# Name::      Sysadmin::TimeExtension
# Author::    774 <http://id774.net>
# Created::   Sep 27, 2012
# Updated::   Sep 27, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

require "time"

module Sysadmin
  module TimeExtension

    def Time.strict_parse(str)
      unix_epoch = Time.at(0)
      time = Time.parse(str, nil) rescue nil
      time = nil if time == unix_epoch
      time
    end

  end
end
