# Aspen Staff License Export to Ed-Fi API

This PowerShell Script ingests a CSV file, maps and creates an Ed-Fi JSON payload and POSTs into the Ed-Fi ODS/API.

## Instructions
1. Download the code: git clone git@github.com:Ed-Fi-Exchange-OSS/BPS-Staff-Licensing.git
2. Add the Extension: Follow [Ed-Fi instructions on how to create and extension](https://techdocs.ed-fi.org/pages/viewpage.action?pageId=95259952) and add the StaffLicense Extension. MetaEd files provided in the Extensions folder.
3. Add the SQL to the Visual Studio Project: ~/Artifacts/*.*
4. Configure environment vars: Open and edit the StaffLicenseAspenTxtToEdFiAPI.ps1 file. Set the apropropriate values for your environment.
5. Open PowerShell as an Administrator and execute the script.

### Context
BPS - Boston Public Schools has the need to add comprehensive data about Staff Licensing. We evaluated the current Ed-Fi model and it didnt have some properties that where requiered for us. This is why we created this simple extension.
It is our desire to share this with the community as we think it is a good sample of how to create a simple PowerShell script that can read a CSV, map it to an Ed-Fi JSON payload and submit the data to the Ed-Fi ODS/API extension we created.


### PowerShell Structure.

Configuration section :  Allows us to configure the Base Api Url, Key , Secret, CSV path,

Create-Json  Section :  Reads an CSV file and creates a Json Object to be posted into the Configured Api.


### Entity Structure.

StaffLicense is the name of the new extension table and contains the next fields:

1. StaffUniqueId:  Relates the license to the Staff
2. LicenseApplicableGradeLevels:  The description of the license.
3. LicenseIssueDate : The month, day, and year on which an active license was issued.
4. LicenseNumber: The unique number issued by the licensing organization
5. LicenseStateIdentifier : The state unique identifier for this license. Example: DESE - ACCOMP
6. LicenseExpirationDate : The month, day, and year on which a license will expire.
7. LicenseEffectiveDate: The month, day, and year on which a license is active or becomes effective. If empty then it is assumed its the Issue Date.
8. LicenseTitle: The title given to the license.
9. LicenseDescription: The description of the license.
10. Accomp: The substring of the license codes used by DESE to identify licenses.
11. LicenseStageDescriptor: The stage this license is in.
12. LicenseStatusDescriptor: An indication of the status of the license.
13. LicensingOrganization: The name of the organization issuing the license.

### Staff License Descriptors.

The Staff License Descriptors are classified in Staff Licenses Status and Staff License Stage.


### Staff Licenses Status

1. Approved
2. Inactive/Invalid
3. Inactive/Invalid: RETELL/SEI R
4. Invalid
5. Invalid: RETELL/SEI R
6. Licensed
7. Licensed: RETELL/SEI R
8. Surrendered


### Staff License Stage

1. Emergency
2. Endorsement
3. Full
4. Initial
5. Initial Extension
6. Preliminary
7. Professional
8. Temporary


### Support
For any support please create a ticket in the Ed-Fi tracker ticketing system: https://tracker.ed-fi.org/ and make sure you select the "Ed-Fi Support (EDFI)" project. 

## Legal Information
Copyright (c) 2021 Ed-Fi Alliance, LLC and contributors.

Licensed under the [Apache License, Version 2.0](LICENSE) (the "License").

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

See [NOTICES](NOTICES.md) for additional copyright and license notifications.