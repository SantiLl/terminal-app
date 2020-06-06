require_relative '../models/file'

class FilesRepository
  def initialize
    @files = []
  end

  def post(file) # Add a new file to collection
    @files << file
  end

  def get(name) # Find a file from the collection.
    @files.find { |file| file.name == name }
  end

  def delete(file) # Destroy file from collection.
    @files.delete(file)
  end
end
