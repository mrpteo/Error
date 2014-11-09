Error-Handling
=====

This gem was designed to speed up and improve error handling through out your Ruby projects. Far too often i see applications with "puts('Error, invalid setting')" not only are these vague but they cannot be refered to later on.

Error allows you to create and manage errors throughout your application.

###Example Usage:

```
  require 'error-handling'
```

  Include error-handling into your application
  
  
```
error = Error.new
```
  Access the error-handling gem
  
  

```
error.create("Error Type","Error description")
```
  Create and save a new error. Pass two parameters, error type and error description.
  
  
```
error.display('all') or error.display(3)
```
  Displays errors currently saved. Usage: display('all') or pass integer e.g. display(2)
  
  
```
error.count
```
  Returns number of errors currently saved, datatype Integer.
  
  
```
error.erase()
```
  Clear all errors currently saved, options: erase('check'), provides a confirmation check to see if user wants to erase all   errors.
  
  
```
error.export('error.log')
```
  Exports all errors into an log file, file is specified within the first parameter.
  
  
```
error.load('error.log')
```
  Load previously exported errors into the application.


```
error.search('error type')
```
  Search saved errors for specific type, will only wok when error types are applied correctly.
