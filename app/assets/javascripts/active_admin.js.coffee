#= require active_admin/base
#
$(window).load ->
  $('#select_judge').on 'change', ->
    option = $(this).find(':selected')
    id = option.prop('value')
    phase = $('#phase').val()
    window.location = "assign_projects?phase=#{phase}&id=#{id}"
