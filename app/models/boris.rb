class Boris < ActiveRecord::Base
	def get_pid
		if pid_file.present?
			pid = `cat #{pid_file} 2>/dev/null`.chomp
			if pid.present?
				pid
			else
				nil
			end
		else
			pid
		end

	end

	def status
		if pid_file.present?
			get_pid.present?
		else
			begin
				Process.kill 0, get_pid
				true
			rescue
				false
			end
		end
	end

	def start
		self.pid = Process.spawn(command_start, :in=>"/dev/null", :out=>"/dev/null", :err=>"/dev/null")
		Process.detach pid
		self.save!
		return status
	end

	def stop
		if status
			Process.kill "TERM", get_pid.to_i
			true
		else
			false
		end

	end

	def restart
		stop && start
	end
end
