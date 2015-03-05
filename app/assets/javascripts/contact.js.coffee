$(document).ready ->
  $(".summernote").summernote
    height: 300,
    minHeight: 300
    maximumImageFileSize: 500000
    onImageUpload: (files, editor, welEditable) ->
      sendFile files[0], editor, welEditable
      return

  sendFile = (file, editor, welEditable) ->
    data = new FormData
    data.append 'file', file
    $.ajax
      data: data
      type: 'POST'
      url: '/contact/upload_img'
      cache: false
      contentType: false
      processData: false
      success: (url) ->
        editor.insertImage welEditable, window.location.origin + url
        return
    return

  $(".checkbox_activate_user").click ->
    $.ajax
      url: "/contact/toggle_user_subscription"
      type: "GET"
      data:
        id: $(this).attr("data-id"),
      contentType: "application/json; charset=utf-8"

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
          if response.errors
            alert response.errors[0]
          else
            alert("Votre template a été sauvegardé.")
            window.location.replace("/contact/new_email?template=" + response.id);
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

  $("#delete-template").click ->
    $('.modal#confirm_delete').modal()
    $('#subject_template_delete').text( $("#select-template option:selected").text() )

  $("#valid-delete-template").click ->
    $.ajax
      url: "/contact/delete_template"
      type: "POST"
      beforeSend: (xhr) ->
        xhr.setRequestHeader 'X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')
        return
      data:
        template_id: $("#select-template").val();
      success: (response) ->
        $('.modal#confirm_delete').modal("hide")
        $("#preview_number_send").text(response)
        return

  $("#load-template").click ->
    window.location.href = "/contact/new_email?template=" + $("#select-template").val();

  $('.default_template_link').click ->
    r = confirm("Vos modification seront perdue si vous chargez un template. Voulez-vous continuer?");
    if (r == false)
        return false;
