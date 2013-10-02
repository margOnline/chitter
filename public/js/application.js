function handlePeepSubmit(){
  var form = $(this);
  var data = {
    "post": form.find('#post').val()
  };
  $.post('/peeps', data, postSuccess);
  return false;
}

// function postPeep(data){
//   , function(data){
//     console.log(data);
//   });
// }

function postSuccess(data,textStatus, jqXHR){
  $('#peeps').prepend(data);
}

//   // $('#add-peep-form').get(0).reset();
//   // displayPeep(data);
// }

// function displayPeep(){
//   var peepHtml = createPeep(data);
//   var peepElement = $(peepHtml);
// }

// function createPeep(data){
//   // var html = '' + '<li class="peep"><span class="source">' + ;
// }

// function postError(jqXHR,textStatus,errorThrown){
//   console.log('error posting peep');
// }