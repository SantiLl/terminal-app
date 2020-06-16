class FolderView
  def folder_helper
    puts 'Folder commands:'
    puts "1. 'create_folder folder_name' "
    puts "2. 'cd folder_name'"
    puts "3. 'cd ..'"
    puts "4. 'destroy_folder folder_name'"
  end

  def delete_folder(folder)
    puts "Folder '#{folder}' deleted successfully!"
  end

  def cant_delete(folder)
    puts "can't destroy_folder: #{folder}: Directory not empty"
  end

  def not_found(folder)
    puts "#{folder}: No such directory."
  end

  def open_folder(folder)
    puts "You've entered in '#{folder}'."
  end

  def close_folder(folder)
    puts "You've closed '#{folder}'."
  end

  def whereami(directory)
    puts directory
  end

  def already_exists(folder)
    puts "#{folder} already exists."
  end

  def display_all(files, directory)
    puts "All files in directory '#{directory}'"
    files.each_with_index do |file, index|
      puts "#{index + 1}. #{file.name}"
    end
  end
end
