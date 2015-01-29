$(document).ready ->

  # # send the file
  # sendFile = (file, editor, welEditable) ->
  #   data = new FormData()
  #   data.append "file", file
  #   $.ajax
  #     data: data
  #     type: "POST"
  #     xhr: ->
  #       myXhr = $.ajaxSettings.xhr()
  #       myXhr.upload.addEventListener "progress", progressHandlingFunction, false  if myXhr.upload
  #       myXhr
  #
  #     url: "/contact/upload"
  #     cache: false
  #     contentType: false
  #     processData: false
  #     success: (url) ->
  #       editor.insertImage welEditable, url
  #       return
  #   return
  #
  # # update progress bar
  # progressHandlingFunction = (e) ->
  #   if e.lengthComputable
  #     $("progress").attr
  #       value: e.loaded
  #       max: e.total
  #
  #     # reset progress on complete
  #     $("progress").attr "value", "0.0"  if e.loaded is e.total
  #   return

  $(".summernote").summernote
    height: 300,
    minHeight: 300
    # onImageUpload: (files, editor, welEditable) ->
    #   editor.insertImage welEditable
    #   sendFile files[0], editor, welEditable
    #   return
