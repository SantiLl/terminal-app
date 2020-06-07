class Router
  def initialize(files_controller, folders_controller)
    @files_controller = files_controller
    @folders_controller = folders_controller
    @running = true
  end

  def greeting
    puts '-'*20
    puts "Welcome to your Terminal! Type 'help' if you don't know any command."
    puts '-'*20
  end

  def run
    greeting
    while @running
      print '> '
      user_answer = gets.chomp
      actions(user_answer)
    end
  end

  def actions(answer)
    if answer.include?('file')
      file_actions(answer)
    elsif answer.include?('folder') || answer.include?('cd') || answer.include?('ls')
      folder_actions(answer)
    elsif answer.include?('help')
      command_helper
    else
      puts "Invalid command '#{answer}', use 'help' to check every command."
    end
  end

  def file_actions(answer)
    file_command = answer.split(' ')
    if file_command[0].include?('show_file') && file_command.size == 2
      @files_controller.show_file(file_command[1])
    elsif file_command[0].include?('metadata_file') && file_command.size == 2
      @files_controller.metadata_file(file_command[1])
    elsif file_command[0].include?('create_file') && file_command.size >= 3
      joined_content = join_content(file_command) if file_command.size > 2
      @files_controller.create_file(file_command[1], joined_content)
    elsif file_command[0].include?('destroy_file') && file_command.size == 2
      @files_controller.destroy_file(file_command[1])
    elsif file_command[0].include?('file') && file_command.size == 2
      @files_controller.display_file_helper
    else
      puts "Invalid operation '#{answer}', use file -h to check all the file commands"
    end
  end

  def folder_actions(answer)
    folder_command = answer.split(' ')
    if folder_command[0].include?('create_folder') && folder_command.size == 2
      @folders_controller.create_folder(folder_command[1])
    elsif folder_command[0].include?('destroy_folder') && folder_command.size == 2
      @folders_controller.destroy_folder(folder_command[1])
    elsif folder_command[0].include?('folder') && folder_command.size == 2
      @folders_controller.display_folder_helper
    elsif folder_command[0].include?('cd') && folder_command.size == 2
      redirect_folder(folder_command[1])
    else
      puts "Invalid operation '#{answer}', use folder -h to check all the file commands"
    end
  end

  def command_helper
    puts "1. For file commands: 'file -h'"
    puts "2. For folder commands: 'folder -h'"
  end

  def join_content(collection)
    content = []
    collection.each_with_index do |element, index|
      content << element if index > 1
    end
    return content.join(' ')
  end

  def redirect_folder(folder)
    if folder.include?('..')
      puts 'You are already in main folder!'
    else
      @folders_controller.open_folder(folder)
      run_in_folder(folder)
    end
  end

  def run_in_folder(folder)
    while @folders_controller.running?(folder)
      print '> '
      user_answer = gets.chomp
      if user_answer == 'ls'
        # displayear todos los archivos que pertenecen a esa carpeta
      elsif user_answer == 'cd ..'
        @folders_controller.close_folder(folder)
      elsif user_answer == 'whereami'
        # mostrar ruta
      else
        puts "Invalid operation '#{answer}', use folder -h to check all the file commands"
      end
    end
  end
end
