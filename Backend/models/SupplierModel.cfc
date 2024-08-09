component {
    public query function get()
    {
		var sql = "SELECT * FROM suppliers";
        var result = queryExecute(
            sql,
            [],
            {datasource: 'DSN_PRODUCT_MANAGEMENT'}
        );

        return result;
    }
}