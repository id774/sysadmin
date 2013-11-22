# Name::      Sysadmin::ArrayExtension
# Author::    774 <http://id774.net>
# Created::   Aug 20, 2013
# Updated::   Nov 21, 2013
# Copyright:: 774 Copyright (c) 2013
# License::   Licensed under the GNU GENERAL PUBLIC LICENSE, Version 3.0.

class Array

  def sum
    inject(0){|result, item| result + item.to_i}
  end

  def sumf
    inject(0){|result, item| result + item.to_f}
  end

  def average
    inject(0.0) { |sum, i| sum += i } / size
  end

  def variance
    ave = self.average
    inject(0.0) { |sum, i| sum += (i - ave)**2 } / size
  end

  def standard_deviation
    Math::sqrt(self.variance)
  end

end
