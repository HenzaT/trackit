require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "Should not save task without name or related project" do
    task = Task.new
    assert_not task.save, "Task saved without required fields (name)"
  end

  test "Should not save task without name, even if it has a project" do
    task = Task.new(project: projects(:one))
    assert_not task.save, "Task saved without a name"
  end

  test "Save task with name and project" do
    task = Task.new(name: "Record guitar", project: projects(:one))
    assert task.save, "Task not saved"
  end

  test "Newly created task should have open status" do
    task = Task.new(name: "Record guitar", project: projects(:one))
    assert_equal "open", task.status
  end

  test "Status should only be updated to paused or closed" do
    statuses = %w[paused closed]
    task = Task.new(name: "Record guitar", project: projects(:one))
    # task has status of 'open' when it is created, this is already tested above
    statuses.each do |s|
      task.status = s
      assert_equal s, task.status
    end
  end

  test "Status should not be anything other than open/paused/closed" do
    task = Task.new(name: "Record guitar", project: projects(:one))
    assert_not task.update(status: "completed"), "Task updated with invalid status"
  end
end
