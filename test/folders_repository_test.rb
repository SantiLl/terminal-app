require 'minitest/autorun'
require_relative '../repositories/folders_repository'
require_relative '../models/folder'

class TestFoldersRepository < Minitest::Test
  describe 'FoldersRepository' do
    it 'should be initialized with FoldersRepository instance' do
      folders_repository = FoldersRepository.new

      folders_repository.must_be_instance_of FoldersRepository
    end
  end

  describe '#post' do
    it 'should create a folder in memory list' do
      repo = FoldersRepository.new
      new_folder = Folder.new(name: 'foldername', directory: '/main')
      repo.post(new_folder)

      repo.all('/main').size.must_equal 1
      repo.all('/main').first.name.must_equal 'foldername'
    end
  end

  describe '#delete' do
    it 'should destroy a folder in memory list' do
      repo = FoldersRepository.new
      new_folder = Folder.new(name: 'foldername', directory: '/main')
      repo.post(new_folder)
      repo.delete(new_folder)

      repo.all('main').size.must_equal 0
      repo.all('main').first.must_equal nil
    end
  end

  describe '#get' do
    it 'should get a folder in memory list' do
      repo = FoldersRepository.new
      new_folder = Folder.new(name: 'foldername', directory: '/main')
      repo.post(new_folder)
      searched_folder = repo.get('foldername', '/main')

      searched_folder.must_equal new_folder
    end
  end

  describe '#all' do
    it 'should get collection of all folders from a directory in memory list' do
      repo = FoldersRepository.new
      new_folder = Folder.new(name: 'foldername', directory: '/main')
      new_folder2 = Folder.new(name: 'work', directory: '/main')
      repo.post(new_folder)
      repo.post(new_folder2)

      repo.all('/main').size.must_equal 2
      repo.all('/main').first.name.must_equal 'foldername'
      repo.all('/main').last.name.must_equal 'work'
    end
  end
end
