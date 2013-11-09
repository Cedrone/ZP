# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$("#new_user").on "change", "#user_name", ->
		t = this
		unless @value is @lastValue
		  @timer = setTimeout(->
		    $.ajax
		      url: "/users/check_signup_username"
		      data: "action=check_signup_username&username=" + t.value
		      dataType: "json"
		      type: "post"
		      success: (data) ->
		      	$('#name_validation_msg').css('color', data[0])
		      	$('#name_validation_msg').text(data[1])
		      error: (data) ->
		      	alert('shit')
		  , 200)
		  @lastValue = @value
	$("#new_user").on "change", "#user_email", ->
		t = this
		unless @value is @lastValue
		  @timer = setTimeout(->
		    $.ajax
		      url: "/users/check_signup_email"
		      data: "action=check_signup_email&email=" + t.value
		      dataType: "json"
		      type: "post"
		      success: (data) ->
		      	$('#email_validation_msg').css('color', data[0])
		      	$('#email_validation_msg').text(data[1])
		      error: (data) ->
		      	alert('shit')
		  , 200)
		  @lastValue = @value
	$("#new_user").on "change", "#user_password", ->
		t = this
		unless @value is @lastValue
		  @timer = setTimeout(->
		    $.ajax
		      url: "/users/check_signup_pw"
		      data: "action=check_signup_pw&pw=" + t.value
		      dataType: "json"
		      type: "post"
		      success: (data) ->
		      	$('#pw_validation_msg').css('color', data[0])
		      	$('#pw_validation_msg').text(data[1])
		      error: (data) ->
		      	alert('shit')
		  , 200)
		  @lastValue = @value
	$("#new_user").on "change", "#user_password_confirmation", ->
		t = this
		unless @value is @lastValue
		  @timer = setTimeout(->
		    $.ajax
		      url: "/users/check_signup_pw_confirmation"
		      data: "action=check_signup_pw_confirmation&pw_confirm=" + t.value
		      dataType: "json"
		      type: "post"
		      success: (data) ->
		      	$('#pw_confirm_validation_msg').css('color', data[0])
		      	$('#pw_confirm_validation_msg').text(data[1])
		      error: (data) ->
		      	alert('shit')
		  , 200)
		  @lastValue = @value
