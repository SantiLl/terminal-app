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

  def not_found(folder)
    puts "#{folder}: No such directory."
  end

  def open_folder(folder)
    puts "You've entered in '#{folder}'."
  end

  def close_folder(folder)
    puts "You've closed '#{folder}'."
  end

  def whereami(folders)
    puts "main/#{folders.join('/')}"
  end

  def already_exists(folder)
    puts "#{folder} already exists."
  end

  def display_all(files, folder)
    puts "All files in folder '#{folder}'"
    files.each_with_index do |file, index|
      puts "#{index + 1}. #{file.name}"
    end
  end
end
