<h3 align="center">altSecurityIdentities Serial Number Converter</h3>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#usage">Usage</a>
    </li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project
There is a lack of examples on the internet on converting the serial number for a certificate to the format altSecurityIdentities expects.  This script will do that and return the value to be used in other scripts.

<!-- USAGE EXAMPLES -->
## Usage
This script accepts a certPath parameter for file location to the certificate.  The script prompts for file path if it is not supplied.  The debug parameter can be set to $true to show original serial number and converted serial number.

Examples:
<ul>
  <li>
    Have script prompt for certificate file path.  Used for manually getting the serial number.
    <ul>
      <li>
        PS> & '.\altSecurityIdentitiesSN.ps1'
      </li>
    </ul>
  </li>
  <li>
    Have script prompt for certificate file path and show both original and converted serial numbers.  Used for manually getting the serial number and showing input/output serial numbers.
    <ul>
      <li>
        PS> & '.\altSecurityIdentitiesSN.ps1' -debug $true
      </li>
    </ul>
  </li>
  <li>
    Supply certificate file path in parameter.  Used for scripting.
    <ul>
      <li>
        PS> & '.\altSecurityIdentitiesSN.ps1' -certPath "C:\certs\cert.crt"
      </li>
    </ul>
  </li>
  <li>
    Call script from a Set-ADUser
    <ul>
      <li>
        Set-ADUser &lt;username> -Replace @{altSecurityIdentities= "X509:&lt;I>DC=com,DC=contoso,CN=ENTERPRISECA&lt;SR>$(powershell -Command "& '.\altSecurityIdentitiesSN.ps1' -certPath 'C:\certs\piv.cer'")"}
      </li>
    </ul>
  </li>
</ul>
