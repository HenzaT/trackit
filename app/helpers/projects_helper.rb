module ProjectsHelper
  def status_classes(project_or_task)
    project_or_task.status === 'open' ? 'bg-open'
    : project_or_task.status === 'paused' ? 'bg-paused'
    : 'bg-page'
  end
end
