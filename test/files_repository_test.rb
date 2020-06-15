require 'minitest/autorun'
require_relative '../repositories/files_repository'
require_relative '../models/file'

class TestFilesRepository < Minitest::Test
  describe 'FilesRepository' do
    it 'should be initialized with FilesRepository instance' do
      files_repository = FilesRepository.new

      files_repository.must_be_instance_of FilesRepository
    end
  end

  describe '#post' do
    it 'should create a file in memory list' do
      repo = FilesRepository.new
      new_file = File.new(name: 'filename', directory: '/main')
      repo.post(new_file)

      repo.all('/main').size.must_equal 1
      repo.all('/main').first.name.must_equal 'filename'
    end
  end

  describe '#delete' do
    it 'should destroy a file in memory list' do
      repo = FilesRepository.new
      new_file = File.new(name: 'filename', directory: '/main')
      repo.post(new_file)
      repo.delete(new_file)

      repo.all('/main').size.must_equal 0
      repo.all('/main').first.must_equal nil
    end
  end

  describe '#get' do
    it 'should get a file in memory list' do
      repo = FilesRepository.new
      new_file = File.new(name: 'filename', directory: '/main')
      repo.post(new_file)
      searched_file = repo.get('filename', '/main')

      searched_file.must_equal new_file
    end
  end

  describe '#all' do
    it 'should get collection of all files from a directory in memory list' do
      repo = FilesRepository.new
      new_file = File.new(name: 'filename', directory: '/main')
      new_file2 = File.new(name: 'work', directory: '/main')
      repo.post(new_file)
      repo.post(new_file2)

      repo.all('/main').size.must_equal 2
      repo.all('/main').first.name.must_equal 'filename'
      repo.all('/main').last.name.must_equal 'work'
    end
  end
end
