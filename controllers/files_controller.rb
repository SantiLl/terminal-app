require_relative '../models/file'
require_relative '../views/file_view'

class FilesController
  def initialize(files_repository)
    @files_repository = files_repository
    @file_view = FileView.new
  end

  def create_file(name, content = 'no content', directory)
    if !@files_repository.get(name, directory)
      new_file = File.new(name: name, content: content, directory: directory)
      @files_repository.post(new_file)
    else
      @file_view.already_exists(name)
    end
  end

  def show_file(file, directory)
    searched_file = @files_repository.get(file, directory)
    if searched_file
      @file_view.display_file(searched_file)
    else
      @file_view.not_found(file)
    end
  end

  def metadata_file(file, directory)
    searched_file = @files_repository.get(file, directory)
    if searched_file
      @file_view.metadata_file(searched_file)
    else
      @file_view.not_found(file)
    end
  end

  def destroy_file(file, directory)
    searched_file = @files_repository.get(file, directory)
    if @files_repository.delete(searched_file)
      @file_view.delete_file(file)
    else
      @file_view.not_found(file)
    end
  end

  def display_file_helper
    @file_view.file_helper
  end
end
