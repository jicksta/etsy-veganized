$ ->

	$("#filter_rules").bind "modified", ->
		updateFormNames()
		$("#inspection").text $("form#filter_rules").serialize()
		if $(".rule").length is 1
			$(".rule-remove").attr "disabled", "disabled"
		else
			$(".rule-remove[disabled]").removeAttr "disabled"
		
	
	$(".rule.dynamic select.properties").live "change", ->
		operatorDropdown: $(this).next "select.operators"
		operatorDropdown.empty()

		selectedProperty: $(this).children("option:selected").val()
		
		# Popular operators dropdown
		selectedPropertyOperators: filters[selectedProperty].operators.sort()
		$(selectedPropertyOperators).each ->
			option: $("<option value='" + this + "'>" + this + "</option>")
			operatorDropdown.append option

		operandWrapper: $(this).siblings(".operand-wrapper").first()

		operands: filters[selectedProperty].operands

		if operands is "text"
			textbox: $("<input type='text' class='operand'></input>")
			$(operandWrapper).empty.append textbox
		else if operands is "currency"
			textbox: $("<input type='text' class='currency operand'>")
			$(operandWrapper).empty.append textbox
		else if operands instanceof Array
			operandDropdown: $("<select class='operand'>")
			$(operands).each ->
				option: $("<option value='" + this + "'>" + this + "</option>")
				operandDropdown.append option
			operandWrapper.empty.append operandDropdown

	$(".rule select,.rule input").live "change keydown", -> $("#filter_rules").trigger "modified"
	
	$(".rule-add").live "click", addRule
	$(".rule-remove").live "click", removeRule

	$(".rule select.properties").change()
	$(".rule select.operators").change()
	
addRule: ->
	propertiesDropdown: $("select.properties").first.clone()
	operatorsDropdown:  $('<select class="operators" name="operator">')
	operandWrapper:     $("<span class='operand-wrapper'>")
	buttons:            $('.rule-management-buttons:last').clone()

	container = $('<div class="rule dynamic">')
	container.append(propertiesDropdown).
	          append(operatorsDropdown).
	          append(operandWrapper).
	          append(buttons)

	$(this).closest(".rule").after container

	propertiesDropdown.change()
	$("#filter_rules").trigger "modified"

	return false

removeRule: ->
  $(this).closest(".rule").remove()
  $("#filter_rules").trigger "modified"
  return false


updateFormNames: ->
  $("#filters .rule.dynamic").each ->
    $(this).find("select.properties").attr("name", "rule_" + index + "_property")
    $(this).find("select.operators").attr("name", "rule_" + index + "_operator")
    $(this).find(".operand").attr("name", "rule_" + index + "_operand")
