$(document).ready(function() {

  $("#filter_rules").bind("modified", function() {
    updateFormNames();
    $("#inspection").text($("form#filter_rules").serialize());
    if($(".rule").length == 1) {
      $(".rule-remove").attr("disabled", "disabled");
    } else {
      $(".rule-remove[disabled]").removeAttr("disabled");
    }
  });

  $(".rule.dynamic select.properties").live("change", function() {
    var operatorDropdown = $(this).next("select.operators");
    operatorDropdown.empty();
    
    var selectedProperty = $(this).children("option:selected").val();
    // Popular operators dropdown
    var selectedPropertyOperators = filters[selectedProperty].operators.sort();
    var operatorOptions = $(selectedPropertyOperators).each(function() {
      var option = $("<option value='" + this + "'>" + this + "</option>");
      operatorDropdown.append(option);
    });

    var operandWrapper = $(this).siblings(".operand-wrapper").first();
    
    var operands = filters[selectedProperty].operands;
    
    if(operands === "text") {
      var textbox = $("<input type='text' class='operand'></input>");
      $(operandWrapper).empty().append(textbox);
    } else if(operands === "currency") {
      var textbox = $("<input type='text' class='currency operand'>");
      $(operandWrapper).empty().append(textbox);
    } else if(operands instanceof Array) {
      var operandDropdown = $("<select class='operand'>");
      $(operands).each(function() {
        var option = $("<option value='" + this + "'>" + this + "</option>");
        operandDropdown.append(option);
      });
      operandWrapper.empty().append(operandDropdown);
    }
  });
  
  $(".rule select,.rule input").live("change keydown", function() {
    $("#filter_rules").trigger("modified");
  });
  $(".rule-add").live("click", addRule);
  $(".rule-remove").live("click", removeRule);

  $(".rule select.properties").change();
  $(".rule select.operators").change();
});

function addRule() {
  var propertiesDropdown = $("select.properties").first().clone();
  var operatorsDropdown  = $('<select class="operators" name="operator">');
  var operandWrapper     = $("<span class='operand-wrapper'>");
  
  var buttons = $('.rule-management-buttons:last').clone();
  
  var container = $('<div class="rule dynamic">');
  container.append(propertiesDropdown).
            append(operatorsDropdown).
            append(operandWrapper).
            append(buttons);
  
  $(this).closest(".rule").after(container);
  
  propertiesDropdown.change();
  $("#filter_rules").trigger("modified");
  
  return false;
}

function removeRule() {
  $(this).closest(".rule").remove();
  $("#filter_rules").trigger("modified");
  return false;
}

function updateFormNames() {
  $("#filters .rule.dynamic").each(function(index) {
    $(this).find("select.properties").attr("name", "rule_" + index + "_property");
    $(this).find("select.operators").attr("name", "rule_" + index + "_operator");
    $(this).find(".operand").attr("name", "rule_" + index + "_operand");
  });
}