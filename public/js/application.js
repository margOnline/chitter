function handlePeepSubmit(){
  var form = $(this);
  var data = {
    "post": form.find('#post').val()
  };
  postPeep(data)
  return false;
}

function postPeep(data){
  $.ajax({
    type: 'POST',
    url: 'add_peep',
    data: data,
    headers: {
      'X-Requested_With': 'XMLHttpRequest'
    },
    success: postSuccess,
    error: postError
  });
}

function postSuccess(data,textStatus, jqXHR){
  $('#add_peep').get(0).reset();
  displayPeep(data);
}

function displayPeep(){
  var peepHtml = createPeep(data);
  var peepElement = $(peepHtml);
}

function createPeep(data){
  var html = '' + '<li class="peep"><span class="source">' + 
}

function postError(jqXHR,textStatus,errorThrown)