require_relative '../models/folder'

class FoldersRepository
  def initialize
    @folders = []
  end

  def post(folder) # Add a new folder to collection
    @folders << folder
  end

  def get(name) # Find a folder from the collection.
    @folders.find { |folder| folder.name == name }
  end

  def delete(folder) # Destroy folder from collection.
    @folders.delete(folder)
  end
end
