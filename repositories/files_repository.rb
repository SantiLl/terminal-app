require_relative '../models/file'

class FilesRepository
  def initialize
    @files = []
  end

  def post(file) # Add a new file to collection
    @files << file
  end

  def get(name, folder) # Find a file from the collection.
    folder = 'main' if folder.nil?
    @files.find { |file| file.name == name and file.folder == folder }
  end

  def delete(file) # Destroy file from collection.
    @files.delete(file)
  end
end
