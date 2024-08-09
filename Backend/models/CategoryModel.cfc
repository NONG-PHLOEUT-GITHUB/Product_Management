component {
    public query function get()
    {
        // writeDump(application)
		var sql = "SELECT * FROM categories";
        var result = queryExecute(
            sql,
            [],
            {datasource: 'DSN_PRODUCT_MANAGEMENT'}
        );

        return result;
    }
}