# Note Taker

Prerequisite.

  - Ruby ~> 2.4.x
  - Rails ~> 5.1.x
  - Mongodb ~> 3.0.x
  
* If Ruby and Rails is not yet installed & setup, follow the [installation guide](http://railsapps.github.io/installrubyonrails-mac.html) to setup.
* If Mongodb is not yet installed, follow the [installation guide](https://docs.mongodb.com/manual/administration/install-community/) to install it.


$ gem install bundler
$ bundle install
$ rails s 


// If you want to run on some specific port then apend -p {portnumber} 
```

Default port will be '3000'
You may access the application at:

http://localhost:3000
```
### End Points

Got get all notes:
{host}/notes

Got get current user's note:
{host}/notes/my_notes
