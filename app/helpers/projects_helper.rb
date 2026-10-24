module ProjectsHelper
  def status_classes(project_or_task)
    project_or_task.status === "open" ? "bg-open border-open-dark"
    : project_or_task.status === "paused" ? "bg-paused border-paused-dark"
    : "bg-white border-gray-500"
  end
end
