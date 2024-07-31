component  {

    this.name = "PRODUCT_MANAGEMENT";
    this.applicationTimeout = createTimeSpan(1,0,30,0);
    this.clientmanagement= "yes";
    this.loginstorage = "session";
    this.sessionmanagement = "yes";
    this.sessiontimeout = createTimeSpan(0,7,0,0);
    this.setClientCookies = "yes";
    this.setDomainCookies = "no";
    this.scriptProtect = "all";
    this.searchImplicitscope = true;
    
    public boolean  function onApplicationStart(){
        application.repBase = getDirectoryFromPath(getCurrentTemplatePath());

        var environnement = createObject("java", "java.lang.System").getenv("APP_ENVIRONMENT");
        if (not isDefined("environnement") || environnement eq "") {
          if (findnoCase('.dev', cgi.server_name)
              or findnoCase('localhost', cgi.server_name)
              or findnoCase('127.0.0.1', cgi.server_name)
              or findnoCase('.product-management.api.com', cgi.server_name)) {
            var environnement = "DEV"; // Developpement test
          }
        }
        
        //Dynamic recovery of the Application.cfg file
        var filePath = Replace(cgi.CF_TEMPLATE_PATH, "\" & listLast(cgi.CF_TEMPLATE_PATH, "\\"), '');
        while (listLast(filePath, "\\") != "Backend")
          filePath = Replace(filePath, "\" & listLast(filePath, "\\"), '');
        application.confFilePath = filePath & "\Application.cfg";

        local.applicationFile = fileRead("#application.confFilePath#");
        var paramsJSON = DeserializeJSON(local.applicationFile);

        // // Loading the config in the application scope
        structAppend(application, paramsJSON["applicationGlobal"]);
        structAppend(application, paramsJSON["application#environnement#"]);
        //Update parameters declared in ColdFusion
        for (var item in application) {
          if (!isQuery(application['#item#'])) {
            if (!isStruct(application['#item#'])) {
              // Evaluate ColdFusion variables
              var aVariable = reMatch('##.+?##', application['#item#']);
              for (var idx in aVariable) {
                application['#item#'] = replace(application['#item#'], idx, evaluate(mid(idx, 2, len(idx) - 2)));
              }
            } else {
              // Evaluate ColdFusion variables in the 1st level of structures
              for (var stItem in application[item]) {
                var aVariable = reMatch('##.+?##', application['#item#']['#stItem#']);
                for (var stIdx in aVariable) {
                  application['#item#']['#stItem#'] = replace(application['#item#']['#stItem#'], stIdx, evaluate(mid(stIdx, 2, len(stIdx) - 2)));
                }
              }
            }
          }
        }
        writeDump(application)

        restInitApplication( 
            dirPath= application.repBase & 'routes\api', 
            serviceMapping="api", 
            password="admin@123"
        );

        return true;
    }
    
    public boolean function onRequestStart( string targetPage ) 
    {
      if( url.keyExists( "reinit" ) )
      {
        lock type="exclusive" scope="application" timeout="20"
        {
          ApplicationStop();
          onApplicationStart();
        }
      }

      return true;
	  }

    function onError(any exception,string EventName){
      WriteOutput( "bad thing happened!" );
      WriteDump( arguments.exception );
      WriteDump( arguments.eventName );
    }
}