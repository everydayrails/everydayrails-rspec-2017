json.extract! task, :id, :name, :project_id, :completed, :created_at, :updated_at
json.url project_task_url([task.project, task], format: :json)
