namespace :categories do
  desc "Refresh the categories of the projects"
  task refresh: :environment do
    Category.where(name: 'Productos y Servicios Eco Amigables').first_or_create
    Category.where(name: 'Tecnologias de Informacion y Comunicacion').first_or_create
    Category.where(name: 'Otros Productos y Servicios Innovadores').first_or_create
  end
end

