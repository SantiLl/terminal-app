require_relative '../models/folder'

class FoldersRepository
  def initialize
    @folders = []
  end

  def post(folder) # Add a new folder to collection
    @folders << folder
  end

  def get(name, directory) # Find a folder from the collection.
    @folders.find { |folder| folder.name == name and folder.directory == directory }
  end

  def delete(folder) # Destroy folder from collection.
    @folders.delete(folder)
  end

  def all(directory_name)
    folder_collection = []
    @folders.each do |folder|
      folder_collection << folder if folder.directory == directory_name
    end
    return folder_collection
  end
end
