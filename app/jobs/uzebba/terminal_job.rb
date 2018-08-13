module Uzebba
  class TerminalJob < ApplicationJob
    queue_as :default

    def perform(*args)
      @terminals = Terminal.order(Arel.sql(" created_at DESC")).all.first(10)
      if Gem.win_platform?
      @terminal = Terminal.create :memory_usage => `wmic OS get TotalVisibleMemorySize /Value`.scan(/\d/).join('').to_i - `wmic OS get FreePhysicalMemory /Value`.scan(/\d/).join('').to_i, :cpu_usage => `wmic cpu get loadpercentage`.scan(/\d/).join('').to_i  
      else   
      @terminal = Terminal.create :memory_usage => `cat /proc/meminfo | grep MemTotal`.scan(/\d/).join('').to_i - `cat /proc/meminfo | grep MemFree`.scan(/\d/).join('').to_i
      end  
    end
  end
end
