#!/usr/bin/env ruby
# Name::      Sysadmin
# Author::    774 <http://id774.net>
# Created::   Mar 23, 2012
# Updated::   Sep  6, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  VERSION = "0.1.1"
  USER_DIR = "/."
  ROOT_DIR = File.expand_path("..", File.dirname(__FILE__))
  $:.unshift ROOT_DIR
  $:.unshift ROOT_DIR + '/lib'
  $:.unshift ROOT_DIR + '/lib/sysadmin'

  require 'file_ext'
  require 'dir_ext'
  require 'directory'
end
