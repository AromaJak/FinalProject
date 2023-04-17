
$(document).ready(function() {
  
   
  $('#searchBtn').on('click' , async function(){
    let stayCheckBox = $('#stayCheckBox').is(':checked');
    let restaurantCheckBox = $('#restaurantCheckBox').is(':checked');
    if(stayCheckBox==false && restaurantCheckBox == false){
      stayCheckBox = true;
      restaurantCheckBox = true;
    } 
    const param = {
      isStay: stayCheckBox,
      isRestaurant: restaurantCheckBox,
      fromDate: $('#from').val(),
      toDate: $('#to').val(),
      roomNum: Number($('#searchRoomNumber').val()),
      name: $('#searchName').val(),
      listType: $('.dropdown-menu a.active').data('index')
    }
    try {
          const searchCondition = await $.ajax({
          url: '/hotel/manager/bookSearch',
          method: 'post',
          data: param
          });
        } catch(err) {
      console.log(err);
    }
  });

 $('.dropdown-menu a').click(function() {
      $('.dropdown-menu a').removeClass('active');
      $(this).addClass('active');
      let text = $(this).text();
      $('#dropdownBtn').text(text);
    });

    $('.bookCancel').on('click' , async function(){
      var booker = $(this).find('input').val();
        try {
          const searchCondition = await $.ajax({
          url: '/hotel/manager/bookCancel?bookTel=' + booker,
          method: 'post',
          });
          location.href = '/hotel/manager/bookList';
        } catch(err) {
      console.log(err);
    }
  })

  $('.checkOutBtn').on('click' , async function(){
    var booker = $(this).find('input').val();
    console.log(booker);
      try {
        const searchCondition = await $.ajax({
        url: '/hotel/manager/checkOut?bookTel=' + booker,
        method: 'post',
        });
        location.href = '/hotel/manager/bookList';
      } catch(err) {
    console.log(err);
  }
})

$('.changeBook').on('click' , async function(){
  const row = $(this).closest('tr');
    const breakfastChecked = row.find('td:eq(7) input[type="checkbox"]').is(':checked');
    const resNoChecked = row.find('td:eq(8) input[type="checkbox"]').is(':checked');
    var booktel = $(this).find('input').val();
    const param = {
      breakfast: breakfastChecked,
      dinner: resNoChecked,
      bookTel: booktel
    }
    try {
      const searchCondition = await $.ajax({
      url: '/hotel/manager/changeBook' ,
      method: 'post',
      data: param
      });
      location.href = '/hotel/manager/bookList';
    } catch(err) {
  console.log(err);
}
})


});