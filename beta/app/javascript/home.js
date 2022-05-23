



$(function() {
    init_date_picker()
  
  });
  
  
  
  
  
  function get_blocked_dates(){
  
    var elem = document.getElementById('blocked_dates');
    var parsed_dates = JSON.parse(elem.dataset.source)
    return parsed_dates
  
  }

  
  function generate_date_rage(dates){
    var Range = []
    var l = dates.length
    for (var i = 0; i<dates.length; i++) {
      for (var d = new Date(dates[i][0]); d <= new Date(dates[i][1]); d.setDate(d.getDate() + 1)) {
        Range.push(moment(d).format('YYYY-MM-DD', d));
      
      }
      }
      return Range
  }
  
  
  
  function init_date_picker(){
    const blocked_dates_array = get_blocked_dates()
    var dateRange = generate_date_rage(blocked_dates_array)
  
    $( "#datepicker" ).daterangepicker({
  
      locale: {
          format: 'YYYY/MM/DD'
      },
      openned: true,
      
      isInvalidDate: function(date) {
        for(var i = 0; i < dateRange.length; i++){
          if (date.format('YYYY-MM-DD') == dateRange[i]){
            return true;
          }
        }
      },
      
      
      });
  
  
    
  }
  