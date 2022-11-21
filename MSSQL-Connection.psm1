<#	
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.196
	 Created on:   	2022. 10. 03. 21:23
	 Created by:   	Cservenyi Szabolcs
	 Organization: 	
	 Filename:     	MSSQL-Connection.psm1
	-------------------------------------------------------------------------
	 Module Name: MSSQL-Connection
	===========================================================================
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





