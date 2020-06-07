class Router
  def initialize(files_controller)
    @files_controller = files_controller
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
    # elsif answer.include?('folder')
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
end
