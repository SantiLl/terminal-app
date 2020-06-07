class FolderView
  def folder_helper
    puts 'File commands:'
    puts "1. 'create_folder folder_name' "
    puts "2. 'cd folder_name'"
    puts "3. 'cd ..'"
    puts "4. 'destroy_folder folder_name'"
  end

  def delete_folder(folder)
    puts "Folder '#{folder}' deleted successfully!"
  end

  def not_found(folder)
    puts "#{folder}: No such directory."
  end
end
