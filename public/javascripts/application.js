function focus_on_element(id) {
	$(id).addClassName('focused')
}

function lose_focus_on_element(id) {
	$(id).removeClassName('focused')
}

function set_display(element, show) {
	show == true ? $(element).show() : $(element).hide()
}

function change_school(select) {
	school_id = select.options[select.selectedIndex].value
	
	elements = $('new_school').getElementsByClassName('school_classrooms')
	elements.each(function (element) {
		element.hide()
	})
	
	elements = $('new_school').getElementsByClassName('school' + school_id)
	elements.each(function (element) {
		element.show()
	})
	
	select.selectedIndex = 0
}
