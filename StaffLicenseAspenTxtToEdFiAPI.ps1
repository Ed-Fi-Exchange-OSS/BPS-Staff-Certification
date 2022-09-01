
# Configuration: Set appopriate values
$Config = @{
	CSVWorkingFile="your_file_here"
	OAuthUrl="/oauth/token"
	BaseApiUrl='https://api.ed-fi.org/v5.3/api'
	EdFiUrl="/data/v3"
	EndPoint="/my-bps/staffLicenses"	
	Key="your_key_here"
	Secret="your_secret_here"
    NamesPace="uri://mybps.org"
}

Function PostToEdfi($dataJSON) 
{
    $GroupedRecords = $dataJSON | group StaffReference, LicenseApplicableGradeLevels,LicenseIssueDate,LicenseNumber,LicenseTitle
    $RepeatedRecords=($dataJSON| Measure-Object).Count -($GroupedRecords| Measure-Object).Count
	If ($RepeatedRecords -gt 0)
	{
		Write-Host "We found $RepeatedRecords repeated  records"
	}
    # extract the requiered parameters from the config file.
    $BaseApiUrl= $Config.BaseApiUrl
    $EdFiUrl= $Config.EdFiUrl
    $OAuthUrl= "$BaseApiUrl" + $Config.OAuthUrl
    $EndPoint= $Config.EndPoint
    Write-Host " *** Getting Token ******** "
    # * Get a token *
    $FormData = @{
        Client_id = $Config.Key
        Client_secret = $Config.Secret
        Grant_type = 'client_credentials'
    }

    $OAuthResponse = Invoke-RestMethod -Uri "$OAuthUrl" -Method Post -Body $FormData
    $token = $OAuthResponse.access_token

    $Headers = @{
		"Accept" = "application/json"
        "Authorization" = "Bearer $token"
        "Content-Type" = "application/json"
    }

    $uri = "$BaseApiUrl" + "$EdFiUrl$EndPoint"
    
    Write-Host "OAuthUrl    *** $OAuthUrl"
    Write-Host "url  ***********$uri"
	
	$i=0
	
	foreach ($rowJSOn in $dataJSON)
	{  
		$i++
		$staffLicense= ConvertTo-Json $rowJSOn
		try {
			$result = Invoke-RestMethod -Uri $uri -Method Post -Headers $Headers -Body $staffLicense
			
			if($i % 500 -eq 0) {
				Write-Host "Processing $i ... "
			}
		}
		catch {
			Write-Host "$i) An error occurred: $uri"
			Write-Host "$staffLicense"
            Write-Host $_
		}
	}

    Write-Host "*** DONE ***"
    
}

Function Create-Json()
{  
      Write-Host "Working file '"  $Config.CSVWorkingFile "'"
      $NamesPace=$Config.NamesPace
      $dataJSON = (
                Import-Csv $Config.CSVWorkingFile  -delimiter "`t"   -Header StaffId,EmplRecord,Name,DeptId,Descr,Accomp,Description,GradeLevel,Stage,
                                                                                  LicenseNo,IssueDate,ExpireDate,LicenseStatus,DateLoaded|Select-Object -Skip 1|
                    ForEach-Object {
                     $GradeLevel =NormalizeGradeLevels $_.'GradeLevel'
                     $LicenseStage =NormalizeStage $_.Stage
                           [PSCustomObject]@{                           
                            StaffReference= @{staffUniqueId=[System.Security.SecurityElement]::Escape($_.StaffId)}
                            LicenseApplicableGradeLevels =[System.Security.SecurityElement]::Escape($GradeLevel)
                            LicenseIssueDate = [System.Security.SecurityElement]::Escape($_.IssueDate)
                            LicenseNumber=[System.Security.SecurityElement]::Escape($_.LicenseNo)               
                            LicenseStateIdentifier = [System.Security.SecurityElement]::Escape('MA')
                            LicenseExpirationDate = [System.Security.SecurityElement]::Escape($_.ExpireDate)
                            LicenseEffectiveDate= [System.Security.SecurityElement]::Escape($_.IssueDate)
							LicenseTitle= [System.Security.SecurityElement]::Escape($_.Description) 
                            LicenseDescription=[System.Security.SecurityElement]::Escape($_.Description)
                            Accomp=[System.Security.SecurityElement]::Escape($_.Accomp)
                            LicenseStageDescriptor= "$NamesPace/LicenseStageDescriptor#" + [System.Security.SecurityElement]::Escape($LicenseStage)
                            LicenseStatusDescriptor="$NamesPace/LicenseStatusDescriptor#" + [System.Security.SecurityElement]::Escape($_.LicenseStatus)
                            LicensingOrganization= [System.Security.SecurityElement]::Escape("org")
                          
                        }

                    })
		Write-Host "**** THERE ARE " Object.keys($dataJSON).length;
        PostToEdfi  $dataJSON
}

 #NormalizeGradeLevels funtion converts Grade to Grades

Function NormalizeGradeLevels($GradeLevel)
{
    if($GradeLevel -Contains "Grade"){
        if( -not($GradeLevel.Contains("Grades"))){
            $GradeLevel -replace "Grade", "Grades"
        }
    }
    return $GradeLevel
}

#NormalizeStage converts Initial - Extension to  Initial Extension
Function NormalizeStage($Stage)
{
    if($Stage -Contains "Initial - Extension"){
        $Stage ="Initial Extension"
    }
    return $Stage
}

Function Init()
{   
    # Enable Logging
    New-Item -ItemType Directory -Force -Path "Logs"
    $date = Get-Date -Format "MM-dd-yyyy-H-m-s"
    $logPath = "Logs\\StaffLicenses_Log_$date.log"
    Start-Transcript -Path $logPath

    Write-Host "*** Initializing Ed-Fi > Staff Certification CSV Processing. ***" -ForegroundColor Cyan

    Write-Host "Creating a Json Object"
    Create-Json

    Stop-Transcript
}
# Execute\Init the task
Init
