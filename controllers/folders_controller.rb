require_relative '../models/folder'
require_relative '../views/folder_view'

class FoldersController
  def initialize(folders_repository, files_repository)
    @folders_repository = folders_repository
    @files_repository = files_repository
    @folder_view = FolderView.new
  end

  def create_folder(name, folder = 'main')
    if !@folders_repository.get(name, folder)
      new_folder = Folder.new(name: name, folder: folder)
      @folders_repository.post(new_folder)
    else
      @folder_view.already_exists(name)
    end
  end

  def destroy_folder(name, folder = 'main')
    searched_folder = check_folder(name, folder)
    if searched_folder
      @folders_repository.delete(searched_folder)
      @folder_view.delete_folder(name)
    end
  end

  def display_folder_helper
    @folder_view.folder_helper
  end

  def open_folder(name, folder = 'main')
    searched_folder = check_folder(name, folder)
    if searched_folder
      @folder_view.open_folder(name)
      return searched_folder.open = true
    end
  end

  def close_folder(name, folder = 'main')
    searched_folder = check_folder(name, folder)
    searched_folder.open = false
    @folder_view.close_folder(name)
  end

  def check_folder(name, folder = 'main')
    searched_folder = @folders_repository.get(name, folder)
    if searched_folder
      return searched_folder
    else
      @folder_view.not_found(name)
      return false
    end
  end

  def check_location(folders)
    @folder_view.whereami(folders)
  end

  def display_all(folder)
    folder = 'main' if folder.nil?
    searched_files = @folders_repository.all(folder).concat(@files_repository.all(folder))
    @folder_view.display_all(searched_files, folder)
  end
end
