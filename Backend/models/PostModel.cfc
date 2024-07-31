component {
    public query function get()
    {
        writeDump(application)
		var sql = "SELECT * FROM posts";
        var result = queryExecute(
            sql,
            [],
            {datasource: application.datasource}
        );

        return result;
    }
}