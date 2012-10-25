# Name::      Sysadmin::Util
# Author::    774 <http://id774.net>
# Created::   Oct 25, 2012
# Updated::   Jul 25, 2012
# Copyright:: 774 Copyright (c) 2012
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

module Sysadmin
  class Util
    class << self
      def create_multi_dimensional_hash
        Hash.new{ |h,k| h[k] = Hash.new(&h.default_proc) }
      end
    end
  end
end
