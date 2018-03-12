﻿configuration Grani_CredentialManager_Config_Present
{
    Import-DscResource -Modulename GraniResource
    Node localhost
    {
        cCredentialManager Present
        {
            InstanceIdentifier = $Node.InstanceIdentifier
            Ensure = $Node.Ensure
            Target = $Node.Target
            Credential = $Node.Credential
        }
    }
}

#configurationData
$configurationDataPresent = @{
    AllNodes = @(
        @{
            NodeName = "localhost"
            PSDscAllowPlainTextPassword = $true
            InstanceIdentifier = "PesterTest"
            Ensure = "Present"
            Target = "PesterTest"
            Credential = New-Object PSCredential ("PesterTestDummy", ("PesterTestPassword" | ConvertTo-SecureString -Force -AsPlainText))
        }
    )
}
