class Version
  @document_ready: ->
    $('#form').on('click', 'a[data-clear-form]', Version.clear_form)
    $('body').on('click', '.seat_column', Version.get_seat_id)

  @clear_form: (e) ->
    e.preventDefault()
    $('#form').fadeOut('slow')
    setTimeout(Version.empty_after_fade(),3000)
    # //$('#form').empty()
    $('.new_button').show()

  @get_seat_id: ->
    row = $(this).data('row')
    column = $(this).data('column')
    if $(this).is('.blue')
      $(this).removeClass('blue')
      $('#purchase_line').addClass('alert-box alert').text("You have not selected a seat to purchase")
    else
      $(this).addClass('blue')
      clear_seat_colors()
      $(this).addClass('blue')
      $('#purchase_line').addClass('alert-box alert').append().text("You have selected #{row} - #{column}.")
    seat_id = $(this).data('id')
    $('#seat_id').val(seat_id)

  @empty_after_fade: ->
    $('#form').empty()

$(document).ready(Version.document_ready)

jQuery ->
    $('#voyages_table').dataTable()
