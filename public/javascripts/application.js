function markItemAsSuccessful(id)
{
  id = "#successful_" + id
  $(id).parent().parent().addClass("successful_teststep_result");
  $(id).parent().children('input').value = "t";
  $(id).addClass("successful_teststep_result");
}

function markItemAsFailed(id)
{
  id = "#failed_" + id
  $(id).parent().parent().addClass("failed_teststep_result");
  $(id).parent().children('input').value = "f";
}

function remove_fields(link)
{
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) 
{
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}
