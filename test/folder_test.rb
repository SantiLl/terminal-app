require 'minitest/autorun'
require_relative '../models/folder'

class TestFolder < Minitest::Test
  describe 'Folder' do
    before do
      @folder = Folder.new(name: 'folder_name', directory: '/main')
    end

    it 'should be initialized with a hash of properties' do
      properties = { name: 'first_directory', directory: '/main/work', open: false }
      folder = Folder.new(properties)
      folder.must_be_instance_of Folder
    end

    it 'should return the the name of the folder' do
      folder = Folder.new(name: 'work', directory: '/main')
      folder.name.must_equal 'work'
    end

    it 'should return the the directory of the folder' do
      folder = Folder.new(directory: '/main/work_directory')
      folder.directory.must_equal '/main/work_directory'
    end

    it '#name should not be nil' do
      @folder.name.wont_be_nil
    end

    it '#open should be false when new folder created' do
      @folder.open.must_equal false
    end
  end
end
