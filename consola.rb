require_relative 'router'
# FILES
require_relative 'controllers/files_controller'
require_relative 'repositories/files_repository'

# FOLDERS
require_relative 'controllers/folders_controller'
require_relative 'repositories/folders_repository'

# FILERS
files_repository = FilesRepository.new
files_controller = FilesController.new(files_repository)

# FOLDERS
folders_repository = FoldersRepository.new
folders_controller = FoldersController.new(folders_repository, files_repository)
router = Router.new(files_controller, folders_controller)

# Start the app
router.run
