component rest="true"  produces="application/json"  restpath="/suppliers" Name="suppliers"{ 

    remote function get () returntype="struct" httpmethod="GET" restPath="/all-suppliers" {
        return new controllers.SupplierController().getSuppliers();
    }
}