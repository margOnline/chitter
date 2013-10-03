function handlePeepSubmit(){
  var form = $(this);
  var data = {
    "post": form.find('#post').val()
  };
  $.post('/peeps', data, function(){});
  return false;
}

function postSuccess(data,textStatus, jqXHR){
  $('#peeps').prepend(data);
}

var pusher = new Pusher('64f9dd5db97a8ce00355');
var channel = pusher.subscribe('peeps');
channel.bind('add-peep', function(peep) {
  $('#peeps').prepend("<li class='peep'>"+peep.post+"</li>"); 
});

