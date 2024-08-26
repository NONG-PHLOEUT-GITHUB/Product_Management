component output="false" accessors="false" produces="application/json" rest="true" restpath="categories" {

  remote struct function getCategories() returntype="struct" httpmethod="GET" restPath="/all-categories" {
    return new cfcs.controllers.CategoryController().getCategories();
  }

  remote struct function getCategoryByID(required string categorieID restargsource="Path") returntype="struct"  httpmethod="GET" restPath="/{categorieID}/category" {
    return new cfcs.controllers.CategoryController().getCategoryByID(arguments.categorieID);
  }
  
  remote struct function deleteCategory(required numeric id restargsource="Path") returnformat="struct" httpmethod="DELETE" restPath="/delete/{id}" {
    return new cfcs.controllers.CategoryController().deleteCategorie(arguments.id);
  }

  remote struct function createCategory(required struct data restargsource="body") returnformat="json" httpmethod="POST" restPath="/create" {
    return new cfcs.controllers.CategoryController().createCategorie(arguments.data);
  }

  remote struct function updateCategory(required struct data restargsource="body") returnformat="json" httpmethod="PUT" restPath="/update" {
    return new cfcs.controllers.CategoryController().createCategorie(arguments.data);
  }

}