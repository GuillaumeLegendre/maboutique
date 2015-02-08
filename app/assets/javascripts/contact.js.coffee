$(document).ready ->
  $(".summernote").summernote
    height: 300,
    minHeight: 300
    maximumImageFileSize: 500000

  $("select").change ->
    $.ajax
      url: "/contact/preview_number_send_sms"
      type: "GET"
      data:
        vip: $("#select_vip").val(),
        gender: $("#select_gender").val()
      contentType: "application/json; charset=utf-8"

      success: (response) ->
        $("#preview_number_send").text(response)
        return

  $("#save-template").click ->
    if $(".summernote").code() && $("#subject").val()
      $.ajax
        url: "/contact/save_template"
        type: "POST"
        beforeSend: (xhr) ->
          xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
          return
        data:
          template:
            subject: $("#subject").val(),
            body: $(".summernote").code()
        success: (response) ->
          $("#preview_number_send").text(response)
          return
    else
      alert("Vous devez compléter le sujet et le corps de l'email pour pouvoir le sauvegarder en tant que template.")

  $("#edit-template").click ->
    if $(".summernote").code() && $("#subject").val()
      $('.modal#confirm_edit').modal()
      $('#subject_template').text( $("#select-template option:selected").text() )
    else
      alert("Vous devez compléter le sujet et le corps de l'email pour pouvoir le sauvegarder en tant que template.")

  $("#valid-edit-template").click ->
    $.ajax
      url: "/contact/edit_template"
      type: "POST"
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      data:
        template:
          subject: $("#subject").val(),
          body: $(".summernote").code()
        template_id: $("#select-template").val();
      success: (response) ->
        $('.modal#confirm_edit').modal("hide")
        $("#preview_number_send").text(response)
        return

  $("#load-template").click ->
    window.location.href = "/contact/new_email?template=" + $("#select-template").val();
