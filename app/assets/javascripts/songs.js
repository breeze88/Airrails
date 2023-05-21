$('#song-filter-form').on('submit', function(event) {
    event.preventDefault();
  
    $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
      success: function(data) {
        $('#song-list').html(data);
      }
    });
  });
  