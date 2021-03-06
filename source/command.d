module std.experimental.database.sql.command;

import std.datetime;
import std.typecons;
import std.variant;
import std.uuid;

import std.experimental.database.sql.connection;
import std.experimental.database.sql.reader;
import std.experimental.database.sql.table;
import std.experimental.database.sql.value;

public enum SqlParameterDirection
{
    Input,
    InputOutput,
    Output,
    Return,
}

public struct SqlParameter
{
    public string name;
    public SqlValue value;
    public bool nullable;
    public int length;
    public ubyte precision;
    public ubyte scale;
    public string udtName;
    public SqlParameterDirection direction;

    public this(string name, SqlValue value)
    {
        this.name = name;
        this.value = value;
        this.nullable = true;
        this.length = 0;
        this.precision = 0;
        this.scale = 0;
        this.udtName = null;
        this.direction = SqlParameterDirection.Input;
    }
}

public struct SqlCommand
{
    public string query;
    public int timeout;
    public SqlParameter[] params;

    public this(string query, int timeout = 0)
    {
        this.query = query;
        this.timeout = timeout;
    }
}
