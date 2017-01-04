# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

submitForm;
buildFinishTable;

submitForm = (form_id) ->
  part_num = form_id 
  user_id = $('#user_id').val()

  if form_id is 'user'
    first_name = $("#first_name").val()
    last_name = $("#last_name").val()
    email = $("#email").val()

    send_data = {login: {first_name: first_name, last_name: last_name, email: email}}

  else if form_id is 'part_one'
    question_1 = $("#part_1_question_1").val()
    question_2 = $("#part_1_question_2").val()
    question_3 = $("#part_1_question_3").val()
    question_4 = $("#part_1_question_4").val()
    question_5 = $("#part_1_question_5").val()
    question_6 = $("#part_1_question_6").val()
    question_7 = $("#part_1_question_7").val()
    question_8 = $("#part_1_question_8").val()
    question_9 = $("#part_1_question_9").val()
    question_10 = $("#part_1_question_10").val()
    question_11 = $("#part_1_question_11").val()
    question_12 = $("#part_1_question_12").val()

    send_data = {user_answer: {part_one: {one: question_1, two: question_2, three: question_3, four: question_4, five: question_5, six: question_6, seven: question_7, eight: question_8, nine: question_9, ten: question_10, eleven: question_11, twelve: question_12}}, user_id: user_id}

  else if form_id is 'part_two'
    $.each $('.part_two_question_one'), ->
      if $(this).is(':checked')
        question_1 = $(this).val()
        return false

    $.each $('.part_two_question_two'), ->
      if $(this).is(':checked')
        question_2 = $(this).val()
        return false

    send_data = {user_answer: {part_two: {one: question_1, two: question_2}}, user_id: user_id}

  else if form_id is 'part_three'
    question_a = undefined
    question_b = undefined
    question_c = undefined
    question_d = undefined
    question_e = undefined
    question_f = undefined

    $.each $('.part_three_question_a'), ->
      if $(this).is(':checked')
        question_a = $(this).val()
        return false

    $.each $('.part_three_question_b'), ->
      if $(this).is(':checked')
        question_b = $(this).val()
        return false

    $.each $('.part_three_question_c'), ->
      if $(this).is(':checked')
        question_c = $(this).val()
        return false

    $.each $('.part_three_question_d'), ->
      if $(this).is(':checked')
        question_d = $(this).val()
        return false

    $.each $('.part_three_question_e'), ->
      if $(this).is(':checked')
        question_e = $(this).val()
        return false

    $.each $('.part_three_question_f'), ->
      if $(this).is(':checked')
        question_f = $(this).val()
        return false

    send_data = {user_answer: {part_three: {one: question_a, two: question_b, three: question_c, four: question_d, five: question_e, six: question_f}}, user_id: user_id}

  else if form_id is 'part_four'
    question_1_a = $("#part_4_question_1_a").val()
    question_1_b = $("#part_4_question_1_b").val()
    question_1_c = $("#part_4_question_1_c").val()
    question_1_d = $("#part_4_question_1_d").val()
    question_1_e = $("#part_4_question_1_e").val()
    question_1_f = $("#part_4_question_1_f").val()

    question_2_a = $("#part_4_question_2_a").val()
    question_2_b = $("#part_4_question_2_b").val()
    question_2_c = $("#part_4_question_2_c").val()
    question_2_d = $("#part_4_question_2_d").val()
    question_2_e = $("#part_4_question_2_e").val()
    question_2_f = $("#part_4_question_2_f").val()
    question_2_g = $("#part_4_question_2_g").val()

    question_3 = undefined

    $.each $('.part_4_question_3'), ->
      if $(this).is(':checked')
        question_3 = $(this).val()
        return false

    send_data = {user_answer: {part_four: {one: question_1_a, two: question_1_b, three: question_1_c, four: question_1_d, five: question_1_e, six: question_1_f, seven: question_2_a, eight: question_2_b, nine: question_2_c, ten: question_2_d, eleven: question_2_e, twelve: question_2_f, thirteen: question_2_g, fourteen: question_3}}, user_id: user_id}

  else if form_id is 'part_five'
    question_1 = $("#part_5_question_1").val()
    question_2 = $("#part_5_question_2").val()
    question_3 = $("#part_5_question_3").val()
    question_4 = $("#part_5_question_4").val()
    question_5 = $("#part_5_question_5").val()
    

    send_data = {user_answer: {part_five: {one: question_1, two: question_2, three: question_3, four: question_4, five: question_5}}, user_id: user_id}

  else if form_id is 'finish'
    question_1 = $("#part_6_question_1").val()
    question_2 = $("#part_6_question_2").val()
    question_3 = $("#part_6_question_3").val()
  
    send_data = {user_answer: {part_six: {one: question_1, two: question_2, three: question_3}}, user_id: user_id}

  if form_id is 'done'
    $.ajax
      url: '/user_answers/finish/' + user_id
      type: 'delete'
      dataType: 'json'
      data: send_data
      success: (data) ->
        location.reload()
        return
      error: (xhr, ajaxOptions, thrownError) ->
        alert "Please call HR before moving forward " + thrownError
        return false
  else
    $.ajax
      url: '/user_answers/' + part_num
      type: 'post'
      dataType: 'json'
      data: send_data
      success: (data) ->
        if part_num is 'part_five'
          alert data["value"]
          buildFinishTable(data["value"])
        else if part_num is 'user'
          $('#user_id').val(data["user_id"])
          $('#timer').css('display', 'block')
          startClock()
        return
      error: (xhr, ajaxOptions, thrownError) ->
        alert "Please call HR before moving forward " + thrownError
        return false

$(document).on 'click', ".next", (e) ->
  e.preventDefault()
  submitForm($(this).attr('id'))
  id = $(this).attr('href')
  $(this).parents(id).css 'display', 'none'
  $(this).parents(id).next().css 'display', 'block' 
  return

$(document).on 'click', ".prev", (e) ->
  e.preventDefault()
  id = $(this).attr('href')
  $(this).parents(id).css 'display', 'none'
  $(this).parents(id).prev().css 'display', 'block' 
  return


$(document).on 'click', ".finish", (e) ->
  e.preventDefault()
  if $("#part_6_question_1").val() == '' || question_2 = $("#part_6_question_2").val() == ''
    $('#part_6_question_1').css('border-color', 'red')
    $('#part_6_question_2').css('border-color', 'red')
    $('.validation_msg').text "You must answer this question."
  else   
    submitForm($(this).attr('id'))
    id = $(this).attr('href')
    $(this).parent().parent().parent().css 'display', 'none'
    $(this).parent().parent().parent().next().css 'display', 'block'
    $('#part_6_question_1').css('border-color', '')
    $('#part_6_question_2').css('border-color', '')
    $('.validation_msg').text ""
    return

$(document).on 'click', ".done", (e) ->
  e.preventDefault()
  submitForm($(this).attr('id'))
  return

buildFinishTable = (tableString) ->
  $('#finishTable').html(tableString)
  return

startClock = ->
  setInterval (-> 
    counter = $('#timer').text()
    counter = counter - 0.01
    if counter == 0.00
      $('#timer').text 0.00
      $.ajax
        url: '/questions/99'
        type: 'delete'
        dataType: 'json'
        data: {id: 99}
        success: (data) ->
          window.location = 'http://' + window.location.host + '/logins/sign_in'
          return
        error: (xhr, ajaxOptions, thrownError) ->
          alert "Please call HR before moving forward " + thrownError
          return false

    else if counter.toFixed(2).toString().match(/.99/)
      counter = counter - 0.40
      $('#timer').text counter.toFixed 2
    else
      $('#timer').text counter.toFixed 2
      return
  ), 1000
return