 Shiny.addCustomMessageHandler("circletype-destroy", function(id) {
   var newid = eval("circletype" + id);
   newid.destroy();
 });
