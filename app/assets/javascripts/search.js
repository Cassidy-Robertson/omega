$(function(){
  $('#home-search form select').on('change', function(event){
    var $select = $(this);
    var selected = $select.val();
    if (selected === 'date'){
      var $input = $select.siblings('input[type=text]')
      $input.attr('type', "date");
    } else {
      var $input = $select.siblings('input[type=date]')
      $input.attr('type', "text");
    }
  })
})
