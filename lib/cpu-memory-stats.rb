# -*- encoding : utf-8 -*-
# CpuMemoryStats will automaticaly choose right system for getting stats
# author: Ondrej Bartas

module CpuMemoryStats

  def self.get
    unless self.constants.include?(OSDetection.detect)
      raise ArgumentError, "cpu-memory-stats can not work on this system, uninstall them or write new module for your system"
    else
      system = CpuMemoryStats.const_get(OSDetection.detect).new
      { 
        :cpu => system.cpu, 
        :memory => system.memory, 
        :load => system.load_avg, 
        :cpu_percent => percent(system.cpu),
        :memory_percent => percent(system.memory),
      }
    end
  end

  def self.percent memory
    maximal = memory.inject(0){|o,i| o+i.last}
    memory.inject({}){|o,i| o[i.first] = (i.last.to_f / maximal.to_f * 100.0).round(2); o }
  end
end

#include OS Detection
require File.join(File.dirname(__FILE__),"/os_detection.rb")

#including modules
Dir[File.join(File.dirname(__FILE__),"/modules/*.rb")].each {|file| require file }
