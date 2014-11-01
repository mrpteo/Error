Error
=====

This gem was designed to speed up and improve error handling through out your Ruby projects. Far too often i see applications with "puts('Error, invalid setting')" not only are these vague but they cannot be refered to later on.

Error allows you to create and manage errors throughout your application.

Example Usage:

error.create("Error Type","Error description")

error.display('all') or error.display(3)

error.count

error.erase()

error.export('error.log')