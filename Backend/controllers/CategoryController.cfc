component output="false" {
    // Constructor to initialize the DAO
    function init() {
        variables.categoryModel = new models.CategoryModel();
        return this;
    }

    public struct function getCategories() {
        var result = { "data":[] };
        var categories = variables.categoryModel.get()
        for(var row in categories){
            arrayAppend(result.data,{
                "id":row.id,
                "name":row.name,
                "description":row.description
                // "stock_quantity":row.stock_quantity,
                // "stock_quantity":row.stock_quantity,
                // "category_id":row.category_id
            })
        }
        // return {"result":products} 
        return result
    }
}