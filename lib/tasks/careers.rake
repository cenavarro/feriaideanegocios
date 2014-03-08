namespace :careers do
  desc "Create all the careers of the TEC"
  task refresh: :environment do
    Career.where(name: 'Administracion de Empresas').first_or_create
    Career.where(name: 'Administracion de Tecnologias de Informacion').first_or_create
    Career.where(name: 'Educacion Tecnica').first_or_create
    Career.where(name: 'Ensenanza de la Matematica asistida por Computadora').first_or_create
    Career.where(name: 'Gestion en Turismo Sostenible').first_or_create
    Career.where(name: 'Ingenieria Agricola').first_or_create
    Career.where(name: 'Ingenieria Agronegocios').first_or_create
    Career.where(name: 'Ingenieria Ambiental').first_or_create
    Career.where(name: 'Ingenieria en Biotecnologia').first_or_create
    Career.where(name: 'Ingenieria en Computacion').first_or_create
    Career.where(name: 'Ingenieria en Computadores').first_or_create
    Career.where(name: 'Ingenieria en Construccion').first_or_create
    Career.where(name: 'Ingenieria en Diseño Industrial').first_or_create
    Career.where(name: 'Ingenieria en Electronica').first_or_create
    Career.where(name: 'Ingenieria en Mantenimiento Industrial').first_or_create
    Career.where(name: 'Ingenieria en Materiales').first_or_create
    Career.where(name: 'Ingenieria en Produccion de Industrial').first_or_create
    Career.where(name: 'Ingenieria en Seguridad Laboral e Higiene Ambiental').first_or_create
    Career.where(name: 'Ingenieria Forestal').first_or_create
    Career.where(name: 'Ingenieria Mecatronica').first_or_create
    Career.where(name: 'Administracion de Empresas - Centro Academico').first_or_create
    Career.where(name: 'Arquitectura y Urbanismo - Centro Academico').first_or_create
    Career.where(name: 'Educacion Tecnica - Centro Academico').first_or_create
    Career.where(name: 'Administracion de Empresas - Sede San Carlos').first_or_create
    Career.where(name: 'Gestion del Turismo Rural Sostenible - Sede San Carlos').first_or_create
    Career.where(name: 'Ingenieria en Agronomia - Sede San Carlos').first_or_create
    Career.where(name: 'Ingenieria en Computacion - Sede San Carlos').first_or_create
    Career.where(name: 'Ingenieria en Produccion de Industrial - Sede San Carlos').first_or_create
    Career.where(name: 'Educacion Tecnica - Sede Alajuela').first_or_create
    Career.where(name: 'Ingenieria en Computacion - Sede Alajuela' ).first_or_create
    Career.where(name: 'Ingenieria en Seguridad Laboral e Higiene Ambiental - Sede Alajuela').first_or_create
  end
end
