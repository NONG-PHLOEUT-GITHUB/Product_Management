component output="false" accessors="false" produces="application/json" rest="true" restpath="products" {
    
    remote struct function getProducts() returntype="struct" httpmethod="GET" restPath="/all-products" {
      return new cfcs.controllers.ProductController().getProducts();
    }

    remote struct function createProduct() returntype="struct" httpmethod="POST" restPath="/create" {
      return new cfcs.controllers.ProductController().create();
    }

    remote struct function getProduct(required string productID restargsource="Path") returntype="struct" httpmethod="GET" restPath="/{productID}" {
      return new cfcs.controllers.ProductController().getProduct(arguments.productID);
    }

    remote struct function deleteProduct(required numeric id restargsource="Path") returnformat="struct" httpmethod="DELETE" restPath="/delete/{id}" {
      return new cfcs.controllers.ProductController().deleteProduct(arguments.id);
    }
}