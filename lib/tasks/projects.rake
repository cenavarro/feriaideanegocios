namespace :projects do
  desc "Add dates to projects"
  task update_dates: :environment do
    Project.update_all(created_at: 1.year.ago, updated_at: 1.year.ago)
  end
end
