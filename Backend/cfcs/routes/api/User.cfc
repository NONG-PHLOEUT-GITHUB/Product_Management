component rest="true"  produces="application/json"  restpath="/users" Name="users"{ 

    remote function get () returntype="struct" httpmethod="GET" restPath="/all-users" {
        return new cfcs.controllers.UserController().getUsers();
    }
    remote function getUserById(required string userID restargsource="Path") returntype="struct" httpmethod="GET" restPath="/{userID}" {
        return new cfcs.controllers.UserController().getUser(arguments.userID);
    }

    remote struct function createUser() returntype="struct" httpmethod="POST" restPath="/create" {
      return new cfcs.controllers.UserController().create();
    }

    remote struct function updateUser() returntype="struct" httpmethod="PUT" restPath="/update/{id}" {
      return new cfcs.controllers.UserController().create();
    }

    remote struct function deleteUser(required numeric id restargsource="Path") returnformat="struct" httpmethod="DELETE" restPath="/delete/{id}" {
      return new cfcs.controllers.UserController().deleteUser(arguments.id);
    }
}