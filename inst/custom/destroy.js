 Shiny.addCustomMessageHandler("circletype-destroy", function(id) {
   // circleTypes defined in circletype.R
   circleTypes["circletype" + id].destroy();
 });
