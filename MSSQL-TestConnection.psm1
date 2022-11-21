<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 03. 21:14
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	MSSQL-TestConnection
	-------------------------------------------------------------------------
	 Module Name: MSSQL-TestConnection
	===========================================================================
#>



function MSSQL-TestConnection
{
	param (
		$Username = "",
		$Password = "",
		$Server = "",
		$DBName = "",
		[bool]$Security = $false,
		$Query = ""
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





