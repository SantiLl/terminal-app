require_relative '../models/file'

class FilesRepository
  def initialize
    @files = []
  end

  def post(file) # Add a new file to collection
    @files << file
  end

  def get(name, directory) # Find a file from the collection.
    @files.find { |file| file.name == name and file.directory == directory }
  end

  def delete(file) # Destroy file from collection.
    @files.delete(file)
  end

  def all(directory_name)
    files_collection = []
    @files.each do |file|
      files_collection << file if file.directory == directory_name
    end
    return files_collection
  end
end
