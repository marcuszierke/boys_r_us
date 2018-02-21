function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var bookingAddress = document.getElementById('booking_address');

    if (bookingAddress) {
      var autocomplete = new google.maps.places.Autocomplete(bookingAddress, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(bookingAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
