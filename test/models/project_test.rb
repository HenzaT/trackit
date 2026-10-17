require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test 'Should not save project without name' do
    project = Project.new
    assert_not project.save, 'Project saved without required fields (name)'
  end

  test 'Save project with name' do
    project = Project.new(name: 'Song1')
    assert project.save, 'Project not saved'
  end

  test 'Newly created project should have open status' do
    project = Project.new(name: 'Song1')
    assert_equal 'open', project.status
  end

  test 'Status should only be updated to paused or closed' do
    statuses = %w[paused closed]
    project = Project.new(name: 'Song1')
    # project has status of 'open' when it is created, this is already tested above
    statuses.each do |s|
      project.status = s
      assert_equal s, project.status
    end
  end

  test 'Status should not be anything other than open/paused/closed' do
    project = Project.new(name: 'Song1')
    assert_not project.update(status: 'completed'), 'Project updated with invalid status'
  end
end
