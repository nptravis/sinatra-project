require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride


use KlassController
use CommentController
use SessionController
use AdminController
use AssignmentController
use UserController
run ApplicationController