component output="false" accessors="false" produces="application/json" rest="true" restpath="categories" {

    /**
    * @httpmethod                 GET
    * @restpath                   /all-categories
    * @consumes                   application/json
    * @hint                       Return a posts for the user
    *
    */
    
    remote struct function getCategories() returnformat="json" {
      return new controllers.CategoryController().getCategories();
    }
}