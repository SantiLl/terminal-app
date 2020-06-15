require 'minitest/autorun'
require_relative '../../models/file'

class TestFile < Minitest::Test
  describe 'File' do
    before do
      @file = File.new(name: 'file_name')
    end

    it 'should be initialized with a hash of properties' do
      properties = { name: 'exercise', content: 'testing exercise' }
      file = File.new(properties)
      file.must_be_instance_of File
    end

    it 'should return the name of the file' do
      file = File.new(name: 'work')
      file.name.must_equal 'work'
    end

    it 'should return the content of the file' do
      file = File.new(name: 'work', content: 'coding challenge')
      file.content.must_equal 'coding challenge'
    end

    it 'should return the folder of the file' do
      file = File.new(name: 'work', content: 'coding challenge', folder: 'work_directory')
      file.folder.must_equal 'work_directory'
    end

    it '#name should not be nil' do
      @file.name.wont_be_nil
    end

    it '#content should be no content if file value empty' do
      @file.content.must_equal 'no content'
    end

    it '#folder should be main if file value empty' do
      @file.folder.must_equal 'main'
    end
  end
end
