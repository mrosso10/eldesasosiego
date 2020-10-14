# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

Rake::Task[:default].prerequisites.clear
task :default do
  sh "bin/rails test"
  sh "HEADLESS_CHROME=1 bin/rails test:system"

  raise unless
    system("bin/rubocop") &
    system("bin/yarn lint")
end
