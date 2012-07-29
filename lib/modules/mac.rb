# -*- encoding : utf-8 -*-
# Module for geting informations from MAC OS X
# author: Ondrej Bartas

module CpuMemoryStats

  class Mac

    def get_stats
      top = `top -F -R -l 1 -n 0`
      
      output = {}
      output[:load_avg] = top.scan(/Load Avg:(.+),(.+),(.+)/i).flatten.collect{|i| i.strip.to_f.round(2)}
      
      cpu = top.scan(/CPU usage:\s+(.+)user,(.+)sys,(.+)idle/i).flatten.collect{|i| i.gsub("%","").strip.to_f.round(2)}
      output[:cpu] = Hash[[:user, :system, :idle].zip(cpu)]
      #fix missing columns
      output[:cpu][:nice] = 0
      output[:cpu][:interupt] = 0

      memory = top.scan(/PhysMem:\s+(.+)wired,(.+)active,(.+)inactive,(.+)used,(.+)free/i).flatten.collect{|i| i.strip}
      mem = Hash[[:wired, :active, :inactive, :used, :free].zip(memory)]
      output[:memory] = mem.inject({}) do |o,v|
        num = v.last.to_i
        o[v.first] = case v.last
        when /G/ then num*1024*1024*1024
        when /M/ then num*1024*1024
        when /K/ then num*1024
        else num end
        o
      end

      output
    end

    def stats
      @stats ||= get_stats
    end

    def cpu
      stats[:cpu]
    end

    def load_avg
      stats[:load_avg]
    end

    def memory
      stats[:memory]
    end

  end
end