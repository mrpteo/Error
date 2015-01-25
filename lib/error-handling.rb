class ErrorHandling
	#global errors array
	$stored_errors = Array.new()

	def create(*error_arguments)
		if error_arguments.length == 2
			#push new error to global errors array.

			#get current date
			time_date = Time.new
			time = time_date.strftime('%Y-%m-%d')
			$stored_errors.push([error_arguments[0], error_arguments[1], time])
		else
			#invalid number or parameters.
			puts("Invalid error syntax, at least 2 parameters expected.")
		end
	end

	def display(display_errors_ammount)
		if $stored_errors.length > 0
			if display_errors_ammount.kind_of? Integer
				if $stored_errors.length > display_errors_ammount
					#display error
					print($stored_errors[display_errors_ammount][0] + ": " + $stored_errors[display_errors_ammount][1])
				else
					puts("Invalid error syntax, invalid error number.")
				end
			elsif display_errors_ammount == 'last'
				print($stored_errors[$stored_errors.length - 1][0] + ": " + $stored_errors[$stored_errors.length - 1][1])

			else
				if display_errors_ammount == 'all'
					#loop through and disply the errors
					$stored_errors.each{ |indiviual_error|
						puts("[" + indiviual_error[2].to_s + "] " + indiviual_error[0] + ": " + indiviual_error[1])
					}
				end
			end
		else
			puts("No errors are currently being stored,")
		end
	end

	def count
		#returns the amount of errors currently stored.
		return $stored_errors.length
	end

	def export(errors_export_name)
		
		#make sure 1 parameter is passed.
		if !errors_export_name
			puts("Invalid errors syntax, parameter expected \"filename\".")
		end

		#create error log file
		File.open(errors_export_name, "w") do |file|

			#loop through the errors putting them into the file
			for i in 0..$stored_errors.length - 1
				error_message = "[" + $stored_errors[i][2] + "] " + $stored_errors[i][0] + ": " + $stored_errors[i][1]
				file.puts(error_message)
			end
		end
	end

	def erase(*include_check)
		if include_check[0] == 'check'
			#provides more control
			print("You are about to erase your errors, would you like to continue? [Y/N]")
			
			#loop to ensure y or n is entered.
			while true
				answer = gets.chop
				if answer.upcase == 'Y'
					$stored_errors.clear
					break
				elsif answer.upcase == 'N'
					break
				end	
			end
		else
			#clear errors without check
			$stored_errors.clear
		end
		return
	end

	def load(*load_file)
		#varify the file does inface exist
		if File.file?(load_file[0])

			#open error file and read each line.
			File.open(load_file[0], "r").each do |file_line|

				#split the items to push individually into the errors array
				error_split = file_line.split(" ")

				#push errors into the $stored_errors array
				$stored_errors.push([error_split[1].chop, error_split[2], error_split[0].slice(1..-1).chop])

				#check for confirmation parameter
				if load_file[1] and load_file[1] == 'confirm'
					puts("External errors file loaded.")
				end

			end
		else
			puts("Load error: \"" + load_file[0] + "\" does not exist.")
		end
	end

	def search(error_type)
		$stored_errors.each{ |error|
			if error[0] == error_type
				puts("[" + error[2] + "] " + error[0] + ": " + error[1])
			end
		}
	end
end