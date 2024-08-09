component {
    public query function get()
    {
        // writeDump(application)
		var sql = "SELECT * FROM products";
        var result = queryExecute(
            sql,
            [],
            {datasource: 'DSN_PRODUCT_MANAGEMENT'}
        );

        return result;
    }
}