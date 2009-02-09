var CucumberExamples = {};

CucumberExamples.specialItemsPage = {
  
  setupComboBoxes:function(){
    $('#special_item_category_id').bind("change keyup", function(){
      var selection = $('option:selected',this).val();
      $('#subcategories-select').load("/subcategories/index?category_id=" + selection);
    })
  }
    
}