#!/usr/bin/env ruby
# Name::      Sysadmin
# Author::    774 <http://id774.net>
# Created::   Mar 23, 2012
# Updated::   Oct 08, 2013
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  VERSION = "0.1.5"
  require File.dirname(__FILE__) +  "/sysadmin/util"
  require File.dirname(__FILE__) +  "/sysadmin/array_ext"
  require File.dirname(__FILE__) +  "/sysadmin/file_ext"
  require File.dirname(__FILE__) +  "/sysadmin/dir_ext"
  require File.dirname(__FILE__) +  "/sysadmin/directory"
  require File.dirname(__FILE__) +  "/sysadmin/time_ext"
end
