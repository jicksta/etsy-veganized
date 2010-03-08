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
  
  $("#toolbar-filters-button").hover(function() {
    $("#filter-pane").slideToggle("fast");
  })
  
  $("#toolbar-randomly-filter-button").click(function() {
    console.log("Size before: " + $("div.images div.preview").length);
    var filteredList = [];
    $("div.images div.preview").each(function() {
      if(Math.random(3) > 0.666 ) {
        filteredList.push(this);
      }
    });
    console.log("Size after: " + filteredList.length);
    $("div.images").quicksand($(filteredList));
  });
  
  $('.preview > img').each(function() {
    $(this).qtip({
      target: this,
      position: {
         corner: {
            target: 'rightMiddle',
            tooltip: 'leftMiddle'
         }
      },
      content: $(this).next(".details"),
      show: 'mouseover',
      hide: 'mouseout',
      show: {
        when: {
          event: "click"
        }
      },
      style: {
        name:'green',
        width: {
          max: 500,
          min: 400
        },
        tip: {
          corner: 'leftMiddle', // We declare our corner within the object using the corner sub-option
          size: {
            x: 20, // Be careful that the x and y values refer to coordinates on screen, not height or width.
            y : 20 // Depending on which corner your tooltip is at, x and y could mean either height or width!
          }
        },
        border: {
          width: 6,
          radius: 8,
        }
      },

  })
  });
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
  $(this).closest("form").trigger("modified");
  
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
