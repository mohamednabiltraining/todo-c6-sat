DateTime dateOnly(DateTime dateTime){
  var newDate = DateTime(dateTime.year,
    dateTime.month,dateTime.day);
  return newDate;
}