component output="false" {
    // Constructor to initialize the DAO
    function init() {
        variables.productModel = new models.ProductModel();
        return this;
    }

    public struct function getProducts() {
        var result = { "data":[] };
        var products = variables.productModel.get()
        for(var row in products){
            arrayAppend(result.data,{
                "id":row.id,
                "name":row.name,
                "price":row.price,
                "stock_quantity":row.stock_quantity,
                "stock_quantity":row.stock_quantity,
                "category_id":row.category_id
            })
        }
        // return {"result":products} 
        return result
    }
}