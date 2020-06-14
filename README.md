# terminal-app
Code challenge: build your own CLI by [ShipNow](https://www.shipnow.com.ar/)

## Guide: using the app

To initialize project:

```ruby
ruby consola.rb
```

### File actions

```ruby
create_file file_name file_content # Creating a file
show_file file_name # Displaying content of a file
metadata_file file_name # Displaying file metadata
destroy_file file_name # Deleting a file
```

### Folder actions

```ruby
create_folder folder_name # Creating a folder
destroy_folder folder_name # Deleting folder
cd folder_name # Navigate inside a certain folder
cd .. # Exit from certain folder
ls # Listing all files in a certain folder
whereami # Displaying user path
```
