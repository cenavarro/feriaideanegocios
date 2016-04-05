module ApplicationHelper
  def link_to_add_participant(f)
    fields = f.fields_for(:participants, Participant.new, :child_index => "new_participants") do |builder|
      render("participant_fields", :f => builder)
    end
    link_to("Agregar participante", "#", onclick: "add_fields(this, \"participants\", \"#{escape_javascript(fields)}\")", class: 'add-participant-link')
  end
end

