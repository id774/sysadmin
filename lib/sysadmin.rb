#!/usr/bin/env ruby
# Name::      Sysadmin::Ruby
# Author::    774 <http://id774.net>
# Version::   0.0.1
# Created::   Mar 23, 2012
# Updated::   Mar 23, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  require 'sysadmin/file_string'

  VERSION = "0.0.1"
  USER_DIR = "/."

  class << self
    attr_accessor :root_dir

    def lib_dir
      File.join(@root_dir, "lib")
    end

    def config_dir
      File.join(@root_dir, "config")
    end

    def user_dir
      @user_dir
    end

    def user_dir=(_user_dir)
      if ENV["SYSADMIN_RUBY_ENV"] == "test" && !(_user_dir.nil?)
        @user_dir = _user_dir 
      else
        @user_dir = File.expand_path("~/") + USER_DIR
      end
    end

    def user_plugins_dir
      File.join(@user_dir, "lib")
    end
  end

end
