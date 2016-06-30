# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, xhr, settings) ->
    $(this).parents('.modal').modal('hide')
    location.reload()
  ).bind("ajax:error", (event, xhr, settings, exceptions) ->
    errors = xhr.responseJSON['errors']
    #error_messages = if xhr.responseJSON['error']
    #  "<div class='alert alert-danger pull-left'>" + xhr.responseJSON['error'] + "</div>"
    #else if xhr.responseJSON['errors']
    #  $.map(xhr.responseJSON["errors"], (v, k) ->
    #    "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
    #  ).join ""
    #else
    #  "<div class='alert alert-danger pull-left'>Unknown error</div>"

    console.log errors
    if (errors.password_confirmation)
      $(".password_confirmation-error").text(errors.password_confirmation[0])
    else
      $(".password_confirmation-error").text("")

    if (errors.password)
      $(".password-error").text(errors.password[0])
    else
      $(".password-error").text("")

    if (errors.email)
      $(".email-error").text(errors.email[0])
    else
      $(".email-error").text("")

    if (errors.username)
      $(".username-error").text(errors.username[0])
    else
      $(".username-error").text("")

    #$(this).parents('.modal-content').children('.modal-footer').html(error_messages)
  )
