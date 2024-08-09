component output="false" {
    // Constructor to initialize the DAO
    function init() {
        variables.supplierModel = new models.SupplierModel();
        return this;
    }

    public struct function getSuppliers() {
        var result = { "data":[] };
        var suppliers = variables.supplierModel.get()
        for(var row in suppliers){
            arrayAppend(result.data,{
                "id":row.id,
                "name":row.name,
                "contact_info":row.contact_info
                // "stock_quantity":row.stock_quantity,
                // "stock_quantity":row.stock_quantity,
                // "category_id":row.category_id
            })
        }
        // return {"result":products} 
        return result
    }
}