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
		begin
			_pid = get_pid
			if _pid.nil?
				_pid = -100
			else
				_pid = _pid.to_i
			end
			Process.kill 0, _pid
			true
		rescue Exception => e
			if pid_file.present?
				puts "Cleaning up old pid file #{pid_file} if exists"
				`rm #{pid_file}` rescue nil
				pid = nil
				save!
			end
			false
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
