# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Delete all projects and tasks
puts '-------- Cleaning Database --------'
Task.destroy_all
Project.destroy_all
puts '-------- Database Cleaned! --------'

# Create projects
puts '-------- Creating Projects --------'
projects = {}
project_names = [ 'The Forest', 'Black and Red', 'Seven', 'Post' ]
project_names.each do |name|
  projects[name] = Project.find_or_create_by!(name: name)
end
projects['The Forest'].update!(status: 'closed')
projects['Seven'].update!(status: 'paused')
puts '-------- Projects Created! --------'

# Create tasks
puts '--------- Creating Tasks ----------'
forest, black_and_red, seven, post = projects.values_at('The Forest', 'Black and Red', 'Seven', 'Post')
forest.tasks.find_or_create_by!(name: 'Record guitar')
forest.tasks.find_or_create_by!(name: 'Rerecord vocals')
forest.tasks.find_or_create_by!(name: 'Think about bridge section', status: 'paused')
black_and_red.tasks.find_or_create_by!(name: 'Write chorus')
black_and_red.tasks.find_or_create_by!(name: 'Write lyrics', status: 'closed')
seven.tasks.find_or_create_by!(name: 'Do final mix')
post.tasks.find_or_create_by!(name: 'Record bass in verse')
post.tasks.find_or_create_by!(name: 'Record outro')
post.tasks.find_or_create_by!(name: 'Rerecord electronic drums', status: 'paused')
post.tasks.find_or_create_by!(name: 'Get rid of left guitar', status: 'closed')
puts '---------- Tasks Created! --------'
