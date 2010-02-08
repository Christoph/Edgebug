function markItemAsSuccessful(id)
{
  id = 'input#' + id;
  $(id).parent().parent().attr('class', "step_description successful_teststep_result");
  $(id).val("t");
}

function markItemAsFailed(id)
{
  id = 'input#' + id;
  $(id).parent().parent().attr('class', "step_description failed_teststep_result");
  $(id).val("f");
}

function remove_fields(link)
{
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) 
{
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}
