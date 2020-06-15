class FileView
  def display_file(file)
    puts "File: ( name: #{file.name} | content: #{file.content} | directory: #{file.directory} )"
  end

  def file_helper
    puts 'File commands:'
    puts "1. 'create_file name content' "
    puts "2. 'show_file filename'"
    puts "3. 'metadata_file filename'"
    puts "4. 'destroy_file filename'"
  end

  def delete_file(file)
    puts "File '#{file}' deleted successfully!"
  end

  def not_found(file)
    puts "#{file}: No such file."
  end

  def metadata_file(file)
    puts file
  end

  def already_exists(file)
    puts "#{file} already exists."
  end
end
