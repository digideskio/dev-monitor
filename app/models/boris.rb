class Boris < ActiveRecord::Base
	def status
		begin
			Process.kill 0, pid
			true
		rescue
			false
		end
	end

	def start
		self.pid = Process.spawn(command_start, :in=>"/dev/null", :out=>"/dev/null", :err=>"/dev/null")
		self.save!
		return status
	end

	def stop
		if status
			Process.kill "TERM", pid
			true
		else
			false
		end

	end

	def restart
		stop && start
	end
end
