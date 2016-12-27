# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

submitForm;

submitForm = (form_id) ->
  if form_id is 'part_one'
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

    send_data = {user_answer: {part_one: {one: question_1, two: question_2, three: question_3, four: question_4, five: question_5, six: question_6, seven: question_7, eight: question_8, nine: question_9, ten: question_10, eleven: question_11, twelve: question_12}}}

  else if form_id is 'part_two'
    $.each $('.part_two_question_one'), ->
      if $(this).is(':checked')
        question_1 = $(this).val()
        return false

    $.each $('.part_two_question_two'), ->
      if $(this).is(':checked')
        question_2 = $(this).val()
        return false

    send_data = {user_answer: {part_two: {one: question_1, two: question_2}}}

  else if form_id is 'part_three'
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

    console.log("Before send")
    send_data = {user_answer: {part_three: {one: question_a, two: question_b, three: question_c, four: question_d, five: question_e, six: question_f}}}

  $.ajax
    url: '/user_answers/part_one'
    type: 'post'
    dataType: 'json'
    data: send_data
    success: (data) ->
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
