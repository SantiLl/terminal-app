require_relative '../models/folder'

class FoldersRepository
  def initialize
    @folders = []
  end

  def post(folder) # Add a new folder to collection
    @folders << folder
  end

  def get(name, folder) # Find a folder from the collection.
    folder = 'main' if folder.nil?
    @folders.find { |searched_folder| searched_folder.name == name and searched_folder.folder == folder }
  end

  def delete(folder) # Destroy folder from collection.
    @folders.delete(folder)
  end

  def all(folder_name)
    folder_collection = []
    @folders.each do |folder|
      folder_collection << folder if folder.folder == folder_name
    end
    return folder_collection
  end
end
