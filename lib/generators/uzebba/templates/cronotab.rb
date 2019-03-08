# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# class TestJob
#   def perform
#     puts 'Test!'
#   end
# end
#
# Crono.perform(TestJob).every 2.days, at: '15:30'
#
 class TerminalsJob
   def perform
      if Gem.win_platform?
      @terminal = Uzebba::Terminal.create :memory_usage => (`wmic OS get TotalVisibleMemorySize /Value`.scan(/\d/).join('').to_d - `wmic OS get FreePhysicalMemory /Value`.scan(/\d/).join('').to_d)/1000, :cpu_usage => `wmic cpu get loadpercentage`.scan(/\d/).join('').to_i  
      else   
      @terminal = Uzebba::Terminal.create :memory_usage => (`cat /proc/meminfo | grep MemTotal`.scan(/\d/).join('').to_d - `cat /proc/meminfo | grep MemFree`.scan(/\d/).join('').to_d)/1000, :cpu_usage => `(grep 'cpu ' /proc/stat;sleep 0.1;grep 'cpu ' /proc/stat)|awk -v RS="" '{print "CPU "($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)"%"}'`.scan(/\d/).join('').to_s.first(2).to_f
      end 
   end
 end

 class TerminalsDeleteJob
   def perform
      @terminal = Uzebba::Terminal.order('created_at ASC').limit(600).destroy_all 
   end
 end
Crono.perform(TerminalsJob).every 1.minute
Crono.perform(TerminalsDeleteJob).every 2.hours
