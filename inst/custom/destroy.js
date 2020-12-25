 Shiny.addCustomMessageHandler("circletype-destroy", function(id) {
   var newid = "circletype" + id;
   var newid2 = eval(newid);
   newid2.destroy();
 });
