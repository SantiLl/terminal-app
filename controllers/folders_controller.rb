require_relative '../models/folder'
require_relative '../views/folder_view'

class FoldersController
  def initialize(files_repository)
    @folders_repository = files_repository
    @folder_view = FolderView.new
  end

  def create_folder(name)
    new_folder = Folder.new(name: name)
    @folders_repository.post(new_folder)
  end

  def destroy_folder(folder)
    searched_folder = @folders_repository.get(folder)
    if @folders_repository.delete(searched_folder)
      @folder_view.delete_folder(folder)
    else
      @folder_view.not_found(folder)
    end
  end

  def display_folder_helper
    @folder_view.folder_helper
  end

  def open_folder(folder)
    searched_folder = @folders_repository.get(folder)
    if searched_folder
      searched_folder.open = true
      @folder_view.open_folder(folder)
    else
      @folder_view.not_found(folder)
    end
  end

  def running?(folder)
    searched_folder = @folders_repository.get(folder)
    return searched_folder.open
  end

  def close_folder(folder)
    searched_folder = @folders_repository.get(folder)
    searched_folder.open = false
    @folder_view.close_folder(folder)
  end
end
