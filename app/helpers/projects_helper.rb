module ProjectsHelper
  def status_classes_card(project_or_task)
    project_or_task.status == "open" ? "bg-open border-open-dark"
    : project_or_task.status == "paused" ? "bg-paused border-paused-dark"
    : "bg-white border-gray-400"
  end

  def status_classes_pill(project_or_task)
    project_or_task.status == "open" ? "bg-open-pill"
    : project_or_task.status == "paused" ? "bg-paused-pill"
    : "bg-gray-200"
  end

  def pill_icon(project_or_task)
    project_or_task.status == "open" ? "fa-circle text-green-500 text-xs"
    : project_or_task.status == "paused" ? "fa-circle text-orange-950 text-xs"
    : "fa-check text-sm"
  end
end
