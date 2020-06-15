require 'minitest/autorun'
require_relative '../repositories/files_repository'
require_relative '../controllers/files_controller'

class TestFilesController < Minitest::Test
  describe 'FilesController' do
    it "should be initialized with a 'FilesRepository' instance" do
      files_repository = FilesRepository.new
      files_controller = FilesController.new(files_repository)
      files_controller.must_be_instance_of FilesController
    end
  end

  describe '#create_file' do
    it 'should ask the user for a name, content, and folder' do
      files_repository = FilesRepository.new
      files_controller = FilesController.new(files_repository)

      files_controller.create_file('challenge', 'shipnow challenge', '/main')
      searched_file = files_repository.get('challenge', '/main')

      searched_file.name.must_equal 'challenge'
      searched_file.content.must_equal 'shipnow challenge'
    end
  end

  describe '#destroy_file' do
    it 'should search for a file in the repo and delete it' do
      files_repository = FilesRepository.new
      files_controller = FilesController.new(files_repository)

      files_controller.create_file('challenge', 'shipnow challenge', '/main')
      files_controller.destroy_file('challenge', '/main')
      files_collection = files_repository.all('/main')
      searched_file = files_repository.get('challenge', '/main')

      searched_file.must_equal nil
      files_collection.size.must_equal 0
    end
  end
end
