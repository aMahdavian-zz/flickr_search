function showImageModal() {  	
  $('#imageModal img').attr('src', $(this).attr('data-img-url'));
  $('#imageModalLabel').html($(this).attr('title'));    
  $('#imageModal').modal('show');
};