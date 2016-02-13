class ErrorHandling

  $stored_errors = Array.new()

  def create(*error_arguments)

    return "Invalid error syntax, at least 2 parameters expected" if error_arguments.length != 2

    #get current date
    time = Time.new.strftime('%Y-%m-%d')
    #store error
		$stored_errors.push([error_arguments[0], error_arguments[1], time])
  end

  def display(display_errors_ammount)

    #make sure errors are being stored
    return puts "No errors are currently being stored." if $stored_errors.length < 0

    #check data type
    if display_errors_ammount.kind_of? Integer

      return "Invalid error syntax, bad error number." if $stored_errors.length < display_errors_ammount

      puts "[#{$stored_errors[display_errors_ammount][2]}] #{$stored_errors[display_errors_ammount][0]}: #{$stored_errors[display_errors_ammount][1]}"

    elsif display_errors_ammount == 'last'

      puts "[#{$stored_errors[$stored_errors.length - 1][2]}] #{$stored_errors[$stored_errors.length - 1][0]}: #{$stored_errors[$stored_errors.length - 1][1]}"

    else

      if display_errors_ammount == 'all'
				#loop through and disply the errors
				$stored_errors.each{ |indiviual_error|
					puts "[#{indiviual_error[2]}] #{indiviual_error[0]}: #{indiviual_error[1]}"
				}
			end
    end
  end

  def count
    return $stored_errors.length
  end

  def export(errors_export_name)

    #make sure filename is a string
    puts "Invalid errors syntax, parameter passed must be a string." if !errors_export_name.kind_of? String

    #create error log file
    File.open(errors_export_name, "a") do |file|

      #loop through the errors putting them into the file
			for i in 0..$stored_errors.length - 1
        error_message = "[#{$stored_errors[i][2]}] #{$stored_errors[i][0]}: #{$stored_errors[i][1]}"
				file.puts(error_message)
			end
    end
  end

  def erase(*include_check)

    if include_check[0] == 'check'
    	#loop to ensure y or n is entered.
    	loop do
        print("You are about to erase your errors, would you like to continue? [Y/N]")
    		answer = gets.chop.upcase

        case answer
        when 'Y' then
          $stored_errors.clear
          break
        when 'N' then break
        else puts "Invalid answer, try again."
        end
    	end
    else
    	#clear errors without check
    	$stored_errors.clear
    end
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
				puts "External errors file loaded." if load_file[1] == 'confirm'

			end
		else
			return "Load error: \"#{load_file[0]}\" does not exist."
		end
	end

	def search(error_type)
		$stored_errors.each{ |error|
			puts "[" + error[2] + "] " + error[0] + ": " + error[1] if error[0] == error_type
		}
	end
end
