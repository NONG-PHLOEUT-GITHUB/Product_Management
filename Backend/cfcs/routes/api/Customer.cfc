component rest="true"  produces="application/json"  restpath="/customers" Name="customers"{ 

    remote function get () returntype="struct" httpmethod="GET" restPath="/all-customers" {
        return new cfcs.controllers.CustomersController().getCustomers();
    }
}