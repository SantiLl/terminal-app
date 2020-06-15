class Router
  def initialize(files_controller, folders_controller)
    @files_controller = files_controller
    @folders_controller = folders_controller
    @running = true
    @opened_folders = ['/main']
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
    elsif answer.include?('folder') || answer.include?('cd') || answer.include?('ls') || answer.include?('whereami')
      folder_actions(answer)
    elsif answer.include?('help')
      command_helper
    elsif answer == 'exit'
      @running = false
    else
      puts "Invalid command '#{answer}', use 'help' to check every command."
    end
  end

  def file_actions(answer)
    file_command = answer.split(' ')
    case [file_command[0], file_command.size]
    when ['show_file', 2]
      @files_controller.show_file(file_command[1], @opened_folders[-1])
    when ['metadata_file', 2]
      @files_controller.metadata_file(file_command[1], @opened_folders[-1])
    when ['create_file', file_command.size]
      joined_content = file_command[2] if file_command.size == 2
      joined_content = join_content(file_command) if file_command.size > 2
      @files_controller.create_file(file_command[1], joined_content, @opened_folders[-1])
    when ['destroy_file', 2]
      @files_controller.destroy_file(file_command[1], @opened_folders[-1])
    when ['file', 2]
      @files_controller.display_file_helper if file_command[1] == '-h'
      invalid_operation(answer, 'file') unless file_command[1] == '-h'
    else
      invalid_operation(answer, 'file')
    end
  end

  def folder_actions(answer)
    folder_command = answer.split(' ')
    case [folder_command[0], folder_command.size]
    when ['create_folder', 2]
      @folders_controller.create_folder(folder_command[1], @opened_folders[-1])
    when ['destroy_folder', 2]
      @folders_controller.destroy_folder(folder_command[1], @opened_folders[-1])
    when ['cd', 2]
      redirect_folder(folder_command[1])
    when ['ls', 1]
      @folders_controller.display_all(@opened_folders[-1])
    when ['whereami', 1]
      @folders_controller.check_location(@opened_folders)
    when ['folder', 2]
      @folders_controller.display_folder_helper if folder_command[1] == '-h'
      invalid_operation(answer, 'folder') unless folder_command[1] == '-h'
    else
      invalid_operation(answer, 'folder')
    end
  end

  def command_helper
    puts "1. For file commands: 'file -h'"
    puts "2. For folder commands: 'folder -h'"
    puts "3. To close the terminal 'exit'"
  end

  def invalid_operation(answer, object)
    puts "Invalid operation '#{answer}', use #{object} -h to check all the #{object} commands"
  end

  def join_content(collection)
    content = []
    collection.each_with_index do |element, index|
      content << element if index > 1
    end
    return content.join(' ')
  end

  def redirect_folder(folder)
    if folder.include?('..') && @opened_folders.size.zero?
      puts 'You are already in main folder!'
    elsif folder.include?('..') && @opened_folders.size.positive?
      @folders_controller.close_folder(@opened_folders[-1], @opened_folders[-2])
      @opened_folders.pop
    else
      run_in_folder(folder) if @folders_controller.check_folder(folder, @opened_folders[-1])
    end
  end

  def run_in_folder(folder)
    if !@opened_folders.include?(folder)
      @folders_controller.open_folder(folder, @opened_folders[-1])
      @opened_folders << folder
    else
      puts 'Folder already opened!'
    end
  end
end
