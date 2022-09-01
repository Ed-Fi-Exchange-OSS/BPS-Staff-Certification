# Aspen Staff License Export to Ed-Fi API

This PowerShell Script ingests a CSV file, maps and creates an Ed-Fi JSON payload and POSTs into the Ed-Fi ODS/API.

## Instructions
1. Download the code: git clone git@github.com:BostonPublicSchools/Ed-FiStaffLicense.git
2. Add the Extension: Follow [Ed-Fi instructions on how to create and extension](https://techdocs.ed-fi.org/pages/viewpage.action?pageId=95259952) and add the StaffLicense Extension. MetaEd files provided in the Extensions folder.
3. Add the SQL to the Visual Studio Project: ~/Artifacts/*.*
4. Configure environment vars: Open and edit the StaffLicenseAspenTxtToEdFiAPI.ps1 file. Set the apropropriate values for your environment.
5. Open PowerShell as an Administrator and execute the script.

### Context
BPS - Boston Public Schools has the need to add comprehensive data about Staff Licensing. We evaluated the current Ed-Fi model and it didnt have some properties that where requiered for us. This is why we created this simple extension.
It is our desire to share this with the community as we think it is a good sample of how to create a simple PowerShell script that can read a CSV, map it to an Ed-Fi JSON payload and submit the data to the Ed-Fi ODS/API extension we created.

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