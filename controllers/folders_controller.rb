require_relative '../models/folder'
require_relative '../views/folder_view'

class FoldersController
  def initialize(folders_repository, files_repository)
    @folders_repository = folders_repository
    @files_repository = files_repository
    @folder_view = FolderView.new
  end

  def create_folder(name, directory)
    if !@folders_repository.get(name, directory)
      new_folder = Folder.new(name: name, directory: directory)
      @folders_repository.post(new_folder)
    else
      @folder_view.already_exists(name)
    end
  end

  def destroy_folder(name, directory)
    searched_folder = check_folder(name, directory)
    if searched_folder
      @folders_repository.delete(searched_folder)
      @folder_view.delete_folder(name)
    end
  end

  def display_folder_helper
    @folder_view.folder_helper
  end

  def open_folder(name, directory)
    searched_folder = check_folder(name, directory)
    if searched_folder
      @folder_view.open_folder(name)
      return searched_folder.open = true
    end
  end

  def close_folder(name, directory)
    searched_folder = check_folder(name, directory)
    searched_folder.open = false
    @folder_view.close_folder(name)
  end

  def check_folder(name, directory)
    searched_folder = @folders_repository.get(name, directory)
    if searched_folder
      return searched_folder
    else
      @folder_view.not_found(name)
      return false
    end
  end

  def check_location(directory)
    @folder_view.whereami(directory)
  end

  def display_all(directory)
    searched_files = @folders_repository.all(directory).concat(@files_repository.all(directory))
    @folder_view.display_all(searched_files, directory)
  end
end
