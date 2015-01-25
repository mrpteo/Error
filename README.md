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
error = ErrorHandling.new
```
  Access the error-handling gem
  
  

```
error.create("Error Type","Error description")
```
  Create and save a new error. Pass two parameters, error type and error description.
  
  
```
error.display('all')

error.display('3')

error.display('last')
```

  Displays errors currently saved. Usage: display('all'), display('last') or pass integer e.g. display(2)
  
  
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

error.load('error.log', 'confirm')
```
  Load previously exported errors into the application. Using the confirm parameter will provide uses with a small confirmation prompt informing them that the errors have all been loaded into the current application.


```
error.search('error type')
```
  Search saved errors for specific type, will only wok when error types are applied correctly.
