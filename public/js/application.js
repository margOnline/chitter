function handlePeepSubmit(e){
  var form = $(this);
  var data = {
    "post": form.find('#post').val()
  };
  $.post('/peeps', data, function(){});
  e.preventDefault();
  clearForm();
}

function postSuccess(data,textStatus, jqXHR){
  $('#peeps').prepend(data);
}

function clearForm(){
  $('#post').val('');
}

var pusher = new Pusher(Pusher.app_id);
var channel = pusher.subscribe('peeps');
channel.bind('add-peep', function(peep) {
  $('#peeps').prepend("<li class='peep'><span class='source'>" + 
    peep.peep_maker.first_name + " " + peep.peep_maker.last_name + " </span><span class='username'>" +
    peep.peep_maker.username + "</span><span class='created'>" + peep.created_at + "</span><p class='post'>" + 
    peep.post +"</p></li>"); 
});

