$(document).on('change','#bug_types', function(){
  console.log("djskks")
  var status_select = $("#bug_status");
  console.log($(this).val())
  if($(this).val() == "bug"){
    console.log(status_select)
    var bug_options = ["new", "started", "resolved"];
    status_select.html("");
    bug_options.forEach(function(option,index){
        status_select.append(`<option value='${option}'>${option}</option>`);
    })
  }
  else{
    var status_options = ["new", "started", "completed"];
    status_select.html("");
    status_options.forEach(function(option,index){
      status_select.append(`<option value='${option}'>${option}</option>`)
  })
  // $("#status_id").html("<option value='new'>new</option><option value='new22'>new221    </option>");
  }
})


$(document).on('ready',function(){
  $(".button_bug").on('click',function(){
    alert(this.id)
    id=this.id
     $.ajax({
             url: "/bugs/assign_bug",
             type: "POST",
             data: {"id" : this.id},
             dataType: "json",
             success: function(data) {
                  $('#'+id+".button_bug").hide();
                 alert('successfully');

     }
   });

  })


  $(".mark_bug").on('click',function(){
    alert(this.id)
    id=this.id
     $.ajax({
             url: "/bugs/mark_bug",
             type: "POST",
             data: {"id" : this.id},
             dataType: "json",
             success: function(data) {
                  $('#'+id+".mark_bug").hide();
                  $('#'+id+".mark_bug_effect").val('hello');

                    alert(data)
                 alert('successfully');

     }
   });

  })

})



