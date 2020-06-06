class FileView
  def display_file(file)
    puts "id: #{file.id} - name: #{file.name} - content: #{file.content}"
  end

  def file_helper
    puts 'File commands:'
    puts "1. 'create_file name content' "
    puts "2. 'show_file filename'"
    puts "3. 'metadata_file filename'"
    puts "4. 'destroy_file filename'"
  end

  def deleted_file
    puts 'File deleted successfully!'
  end
end
