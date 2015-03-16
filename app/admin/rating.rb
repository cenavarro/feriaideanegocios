ActiveAdmin.register Rating do
  menu priority: 2
  permit_params :judge_id, :project_id, :phase, :criteria_1, :criteria_2, :criteria_3, :criteria_4, :criteria_5, :criteria_6, :criteria_7

  scope :current, default: true

  (Rating.pluck(:created_at).map(&:year).uniq - ["2015"]).each do |year|
    scope(year.to_s) { |scope| scope.where('extract(year from created_at) = ?', year) }
  end

  index do
    selectable_column
    if current_admin_user.admin?
      column :judge
    end
    column :project
    column :phase
    column :average
    actions
  end

  controller do
    def scoped_collection
      if current_admin_user.admin?
        Rating.all
      else
        current_admin_user.ratings
      end
    end
  end

  filter :judge
  filter :project
  filter :phase

  form do |f|
    f.inputs "", class: 'inputs rate-form' do
      if current_admin_user.admin?
        f.input :judge, as: :select, collection: Judge.all.map{ |j| [j.email, j.id] }, include_blank: false
        f.input :project, include_blank: false
        f.input :phase
      else
        if f.object.new_record?
          f.input :project, as: :select, collection: (current_admin_user.unrated_projects), include_blank: false
        else
          f.input :project_id, as: :hidden
        end
        f.input :judge_id, as: :hidden, value: current_admin_user.id
        f.input :phase, as: :hidden, value: current_admin_user.phase
      end
      f.input :criteria_1, label: 'Innovación y creatividad: atributos novedosos en el producto desarrollado, que permiten mejorar el desempeño con respecto a productos similares o crea algo relativamente nuevo o se logra desarrollar un nuevo concepto a partir de otros ya establecidos'
      f.input :criteria_2, label: 'Potencial de mercado: conocimiento sobre quien es su mercado meta, su dimensión y accesibilidad.'
      f.input :criteria_3, label: 'Ventaja competitiva potencial: cuál es el valor agregado del producto o servicio para el consumidor, cual es su utilidad diferenciada. Ventajas por sobre la competencia,  ¿por qué el cliente potencial preferirá comprar su servicio o producto y no otros existentes?'
      f.input :criteria_4, label: 'Factibilidad técnica: noción de elementos técnicos que permitan la posible fabricación o prestación del servicio. Los proponentes tienen o pueden acceder al nivel técnico de conocimiento requerido para implementar el producto o servicio.'
      f.input :criteria_5, label: 'Impacto ambiental y/o social: los proponentes han realizado algún análisis preliminar sobre posibles impactos ambientales o sociales que deban preverse  como parte del proceso de implementación'
      if !current_admin_user.admin? && current_admin_user.phase == 2
        f.input :criteria_6, label: 'Desempeño personal: claridad, coherencia, pertinencia y fluidez al presentar la idea de negocios ante el Jurado. Además elementos de presentación personal y profesionalismo de las personas del grupo.'
        f.input :criteria_7, label: 'Presentación del stand: signos externos de la mercadotecnia presentes en el punto de venta que contribuyen a una mejor presentación y explicación del bien o producto que se expone'
      end
    end
    f.actions
  end
end

