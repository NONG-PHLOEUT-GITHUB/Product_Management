component output="false" accessors="false" produces="application/json" rest="true" restpath="products" {

    /**
    * @httpmethod                 GET
    * @restpath                   /all-products
    * @consumes                   application/json
    * @hint                       Return a posts for the user
    *
    */
    
    remote struct function getProduct() returnformat="json" {
      return new controllers.ProductController().getProducts();
    }
}