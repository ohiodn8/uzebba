require_dependency "uzebba/application_controller"

module Uzebba
  class TerminalsController < ApplicationController
  def index
      @terminals = Terminal.order(Arel.sql(" created_at DESC")).all.first(10)
      if Gem.win_platform?
      @terminal = Terminal.limit(10).create :memory_usage => (`wmic OS get TotalVisibleMemorySize /Value`.scan(/\d/).join('').to_d - `wmic OS get FreePhysicalMemory /Value`.scan(/\d/).join('').to_d)/1000, 
      :cpu_usage => `wmic cpu get loadpercentage`.scan(/\d/).join('').to_i  
      else   
      @terminal = Terminal.create :memory_usage => (`cat /proc/meminfo | grep MemTotal`.scan(/\d/).join('').to_d - `cat /proc/meminfo | grep MemFree`.scan(/\d/).join('').to_d)/1000, 
      :cpu_usage => `(grep 'cpu ' /proc/stat;sleep 0.1;grep 'cpu ' /proc/stat)|awk -v RS="" '{print "CPU "($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)"%"}'`.scan(/\d/).join('').to_s.first(2).to_f
      end 
  end
  end
end
