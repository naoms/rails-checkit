# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	initialize = () ->
		$('#form').fadeIn 500
		$('.checklist-details-task input').on 'click', (e) ->
			$(this).siblings('.task-status').html e.target.checked || 'false'
			elem = $(e.target);
			taskid = elem.attr('taskid');
			checklistid = elem.attr('checklist');
			#/checklists/:checklist_id/tasks/:task_id/update_status(.:format)
			$.ajax '/checklists/' + checklistid + '/tasks/' + taskid + '/update_status',
	        	type: 'POST'
	        	dataType: 'html'
	        	data: 'status=' + (e.target.checked || 'false')
	        	error: (jqXHR, textStatus, errorThrown) ->
	            	$('body').append "AJAX Error: #{textStatus} #{errorThrown}"
	        	success: (data, textStatus, jqXHR) ->
		            $('body')#.append "Successful AJAX call: #{data}"

		#	$.post '/checklists/123/tasks/456/update_status',
		#        checked: e.target.checked || 'false'
	    #    	(data) -> alert 'hi'+data #$('body').append "Successfully posted to the page."

			
	$(document).on 'page:load', initialize