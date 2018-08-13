module Uzebba
  module TerminalsHelper
    def total_mem
      if Gem.win_platform?
        `wmic OS get TotalVisibleMemorySize /Value`.scan(/\d/).join('').to_d/1000
      else
        `cat /proc/meminfo | grep MemTotal`.scan(/\d/).join('').to_d/1000
      end
    end
    
    def available_mem
      if Gem.win_platform?
        `wmic OS get FreePhysicalMemory /Value`.scan(/\d/).join('').to_d/1000
      else
        `cat /proc/meminfo | grep MemFree`.scan(/\d/).join('').to_d/1000
      end
    end    
    
  end
end
