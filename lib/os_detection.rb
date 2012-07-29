# -*- encoding : utf-8 -*-
# OS detection based on RB CONFIG by Zucker
# http://rbjl.net/35-how-to-properly-check-for-your-ruby-interpreter-version-and-os
# edited by Ondrej Bartas

require 'rbconfig';

module CpuMemoryStats
  class OSDetection
    def self.detect
      case RbConfig::CONFIG['host_os']
      when /linux|cygwin/ then :Linux
      when /mac|darwin/ then :Mac
      when /bsd/ then :Bsd
      when /mswin|win|mingw/ then :Windows
      when /solaris|sunos/ then :Solaris
      else :unknown
      end
    end
  end
end