#!/usr/bin/env ruby
# Name::      Sysadmin::Ruby
# Author::    774 <http://id774.net>
# Version::   0.0.2
# Created::   Mar 23, 2012
# Updated::   Mar 24, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  VERSION = "0.0.2"
  USER_DIR = "/."
  ROOT_DIR = File.expand_path("..", File.dirname(__FILE__))
  $:.unshift ROOT_DIR
  $:.unshift ROOT_DIR + '/lib'
  $:.unshift ROOT_DIR + '/lib/sysadmin'

  require 'file_string'
end
