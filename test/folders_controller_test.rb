require 'minitest/autorun'
require_relative '../repositories/folders_repository'
require_relative '../repositories/files_repository'
require_relative '../controllers/folders_controller'

class TestFoldersController < Minitest::Test
  describe 'FoldersController' do
    it "should be initialized with a 'FoldersRepository' instance" do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)
      folders_controller.must_be_instance_of FoldersController
    end
  end

  describe '#create_folder' do
    it 'should ask the user for a name, content, and folder' do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)

      folders_controller.create_folder('challenge_directory')
      searched_folder = folders_repository.get('challenge_directory', 'main')

      searched_folder.name.must_equal 'challenge_directory'
      searched_folder.folder.must_equal 'main'
    end
  end

  describe '#destroy_folder' do
    it 'should search for a folder in the repo and delete it' do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)

      folders_controller.create_folder('challenge_directory', 'shipnow')
      folders_controller.destroy_folder('challenge_directory', 'shipnow')
      folders_collection = folders_repository.all('shipnow')
      searched_folder = folders_repository.get('challenge_directory', 'shipnow')

      searched_folder.must_equal nil
      folders_collection.size.must_equal 0
    end
  end

  describe '#open_folder' do
    it 'should change folder open from false to true' do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)

      folders_controller.create_folder('challenge_directory')
      folders_controller.open_folder('challenge_directory')
      searched_folder = folders_repository.get('challenge_directory', 'main')

      searched_folder.open.must_equal true
    end
  end

  describe '#close_folder' do
    it 'should change folder open from true to false' do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)

      folders_controller.create_folder('challenge_directory')
      folders_controller.open_folder('challenge_directory')
      folders_controller.close_folder('challenge_directory')
      searched_folder = folders_repository.get('challenge_directory', 'main')

      searched_folder.open.must_equal false
    end
  end

  describe '#check_folder' do
    it 'should return folder if exists in memory' do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)

      folders_controller.create_folder('challenge_directory')
      controller_search = folders_controller.check_folder('challenge_directory')
      repo_search = folders_repository.get('challenge_directory', 'main')

      controller_search.must_equal repo_search
    end

    it 'should return false if folder doesnt exist in memory' do
      files_repository = FilesRepository.new
      folders_repository = FoldersRepository.new
      folders_controller = FoldersController.new(folders_repository, files_repository)

      controller_search = folders_controller.check_folder('challenge_directory')

      controller_search.must_equal false
    end
  end
end
