<#
  .Synopsis
   Connection to MSSQL database.

  .Description
   The module provides assistance for testing the connection to an MSSQL database.

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
   MSSQL-TestConnection -Username "sa" -Password "P@ssw0rd" -Server "mssql-srv\SQLEXPREE" -DBName "SQLDB" -Security $false
#>

function MSSQL-TestConnection
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
		$DBName = "",
		[bool]$Security = $false,
	)
	$ErrorActionPreference = 'Stop'
	try
	{
		$Connection = New-Object System.Data.SqlClient.SqlConnection
		$Connection.ConnectionString = "Server = $Server; Database = $DBName; User ID= $Username; Password= $Password; Integrated Security = $Security"
		$Connection.Open()
		$true
	}
	catch
	{
		$false
	}
	finally
	{
		$Connection.Close()
	}
}

Export-ModuleMember MSSQL-TestConnection





