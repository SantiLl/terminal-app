require_relative '../models/file'
require_relative '../views/file_view'

class FilesController
  def initialize(files_repository)
    @files_repository = files_repository
    @file_view = FileView.new
  end

  def create_file(name, content)
    p name
    p content
    new_file = File.new(name: name, content: content)
    @files_repository.post(new_file)
  end

  def show_file(file)
    searched_file = @files_repository.get(file)
    @file_view.display_file(searched_file)
  end

  def destroy_file(file)
    searched_file = @files_repository.get(file)
    @files_repository.delete(searched_file)
    @file_view.deleted_file
  end

  def display_file_helper
    @file_view.file_helper
  end
end