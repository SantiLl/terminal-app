require_relative 'router'
require_relative 'controllers/files_controller'
require_relative 'repositories/files_repository'

files_repository = FilesRepository.new
files_controller = FilesController.new(files_repository)
router = Router.new(files_controller)

# Start the app
router.run
