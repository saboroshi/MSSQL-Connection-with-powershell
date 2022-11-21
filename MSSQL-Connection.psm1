<#	
  .Synopsis
   Connection to MSSQL database.

  .Description
   The module helps you connect to an MSSQL database and run arbitrary queries.

  .Parameter Username
   Username required to connect to the database.

  .Parameter Password
   The password required to connect to the database.

  .Parameter Server
   The database server address.

  .Parameter DBName
   The name of the database.

  .Parameter Query
   The script/query to be run on the database.

  .Parameter Security
   Setting up an encrypted connection for the database connection.
   True/False setting. Default setting is False.

  .Example
   MSSQL-Connection -Username "sa" -Password "P@ssw0rd" -Server "mssql-srv\SQLEXPREE" -DBName "SQLDB" -Security $false -Query "SELECT * FROM SQLTABLE"
#>

function MSSQL-Connection
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
		$DBName = "",
		[bool]$Security = $false,
		$Query = ""
	)
	$Connection = New-Object System.Data.SqlClient.SqlConnection
	$Connection.ConnectionString = "Server = $Server; Database = $DBName; User ID= $Username; Password= $Password; Integrated Security = $Security"
	$Cmd = New-Object System.Data.SqlClient.SqlCommand
	$Cmd.CommandText = $Query
	$Cmd.Connection = $Connection
	$Adapter = New-Object System.Data.SqlClient.SqlDataAdapter
	$Adapter.SelectCommand = $Cmd
	$DataSet = New-Object System.Data.DataSet
	$Adapter.Fill($DataSet)
	$DataSet.Tables[0]
	$Connection.Close()
}

Export-ModuleMember MSSQL-Connection





