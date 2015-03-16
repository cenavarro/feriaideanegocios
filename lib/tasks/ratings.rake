namespace :ratings do
  desc "Add dates to ratings"
  task update_dates: :environment do
    Rating.update_all(created_at: 1.year.ago, updated_at: 1.year.ago)
  end
end
