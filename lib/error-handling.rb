class Error
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
		if display_errors_ammount.kind_of? Integer
			if $stored_errors.length > display_errors_ammount
				#display error
				print($stored_errors[display_errors_ammount - 1][0] + ": " + $stored_errors[display_errors_ammount - 1][1])
			else
				puts("Invalid error syntax, invalid error number.")
			end
		else
			if display_errors_ammount == 'all'

				#loop through and disply the errors
				$stored_errors.each{ |indiviual_error|
					puts("[" + indiviual_error[2].to_s + "] " + indiviual_error[0] + ": " + indiviual_error[1])
				}
			end
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

	def load(file_name)
		#varify the file does inface exist
		if File.file?(file_name)

			#open error file and read each line.
			File.open(file_name, "r").each do |file_line|

				#split the items to push individually into the errors array
				error_split = file_line.split(" ")

				#push errors into the $stored_errors array
				$stored_errors.push([error_split[1].chop, error_split[2], error_split[0].slice(1..-1).chop])
			end
		else
			puts("Load error: \"" + file_name + "\" does not exist.")
		end
	end
end