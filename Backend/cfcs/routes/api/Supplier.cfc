component rest="true"  produces="application/json"  restpath="/suppliers" Name="suppliers"{ 

    remote function get () returntype="struct" httpmethod="GET" restPath="/all-suppliers" {
        return new cfcs.controllers.SupplierController().getSuppliers();
    }

    remote struct function getById(required string supplierID restargsource="Path") returntype="struct" httpmethod="GET" restPath="/{supplierID}" {
      return new cfcs.controllers.SupplierController().getById(arguments.supplierID);
    }

    remote struct function createSupplier(required struct data restargsource="body") returnformat="json" httpmethod="POST" restPath="/create" {
      return new cfcs.controllers.SupplierController().createSupplier(arguments.data);
    }

    remote struct function deleteSupplier(required numeric id restargsource="Path") returnformat="struct" httpmethod="DELETE" restPath="/delete/{id}" {
      return new cfcs.controllers.SupplierController().deleteSupplier(arguments.id);
    }
}