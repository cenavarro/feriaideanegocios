function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").remove();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

$(function() {
  //New project modal
  $("#new-idea-form").dialog({
    autoOpen: false,
    height: 593,
    width: 800,
    modal: true,
    buttons: {
      "Ingresar Idea": function() {
        $('#server-errors').hide();
        $("#list-errors").empty();
        if($('.fields').length > 0){
          $('#new_project').submit();
        }else{
          $('#new-idea-form').scrollTop(0);
          $('#server-errors').show();
          $("#list-errors").append("<li>Para poder ingresar una idea de negocio se requiere como minimo un participante</li>");
        }
      },
      "Cancelar": function() {
        $(this).dialog("close");
      }
    },
    close: function() {
      $('#new_project')[0].reset();
      $('.fields').remove()
    }
  });

  //Add listener to click new project modal
  $("#new-idea").click(function(e) {
    e.preventDefault();
    $( "#new-idea-form" ).dialog("open");
  });

  //Add listener to click new project modal
  $("#denied-link").click(function(e) {
    e.preventDefault();
    alert('No estamos en periodo de recepcion de ideas de negocio.')
  });

  //Add listeners to ajax form event
  $("#new_project").on("ajax:success", function(e, data, status, xhr) {
    alert('Idea Ingresada exitosamente!');
    $("#new-idea-form").dialog("close");
  }).bind("ajax:error", function(e, xhr, status, error){
    $('#new-idea-form').scrollTop(0);
    $('#server-errors').show();
    var errorsArray = $.parseJSON(xhr.responseText)["errors"];
    $.each(errorsArray, function(index, value){
      $("#list-errors").append("<li>" + value + "</li>");
    });
  });

  //Start form validation
  $("#new_project").validate();
});
