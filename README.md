Error
=====

This gem was designed to speed up and improve error handling through out your Ruby projects. Far too often i see applications with "puts('Error, invalid setting')" not only are these vague but they cannot be refered to later on.

Error allows you to create and manage errors throughout your application.

Example Usage:

require 'Error'


error = Errors.new
x = gets.chop

if x.kind_of? Integet
	#run application

	puts("#{x} is a number")
else
	error.create("Invalid Data Type", "The data type you have entered is incorrect. Please enter an Integer in future.")
end

if error.count > 0
	error.display('all')
end

