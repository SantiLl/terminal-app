require 'minitest/autorun'
require_relative '../models/file'

class TestFile < Minitest::Test
  describe 'File' do
    before do
      @file = File.new(name: 'file_name')
    end

    it 'should be initialized with a hash of properties' do
      properties = { name: 'exercise', content: 'testing exercise', directory: 'work_directory' }
      file = File.new(properties)
      file.must_be_instance_of File
    end

    it 'should return the name of the file' do
      file = File.new(name: 'work', directory: 'work_directory')
      file.name.must_equal 'work'
    end

    it 'should return the content of the file' do
      file = File.new(name: 'work', content: 'coding challenge', directory: 'work_directory')
      file.content.must_equal 'coding challenge'
    end

    it 'should return the directory of the file' do
      file = File.new(name: 'work', content: 'coding challenge', directory: 'work_directory')
      file.directory.must_equal 'work_directory'
    end

    it '#name should not be nil' do
      @file.name.wont_be_nil
    end

    it '#content should be no content if file value empty' do
      @file.content.must_equal 'no content'
    end
  end
end
