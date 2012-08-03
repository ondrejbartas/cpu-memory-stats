# -*- encoding : utf-8 -*-
# Module for geting informations from BSD
# author: Ondrej Bartas

module CpuMemoryStats

  class Bsd

    def get_stats
      
      output = { :cpu => {} } 
      
      output[:load_avg] = `sysctl -n vm.loadavg`.gsub(/\{|\}/,"").strip.split(" ").collect{|i| i.strip.to_f.round(2)}
      
      cpu = `sysctl -n kern.cp_time`.strip.split(" ").collect{|i| i.strip.to_i}
      cpu_start = Hash[[:user, :nice, :system, :interupt, :idle].zip(cpu)]
      sleep(1)
      cpu = `sysctl -n kern.cp_time`.strip.split(" ").collect{|i| i.strip.to_i}
      cpu_end = Hash[[:user, :nice, :system, :interupt, :idle].zip(cpu)]

      cpu_end.each do |key, value|
        output[:cpu][key] = value - cpu_start[key]
      end      

      output[:memory] = {
        :wired => `sysctl -n vm.stats.vm.v_wire_count`.to_i, 
        :active => `sysctl -n vm.stats.vm.v_active_count`.to_i, 
        :inactive => `sysctl -n vm.stats.vm.v_inactive_count`.to_i, 
        :used => 0,       #fix missing columns
        :free => `sysctl -n vm.stats.vm.v_free_count`.to_i
      }
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