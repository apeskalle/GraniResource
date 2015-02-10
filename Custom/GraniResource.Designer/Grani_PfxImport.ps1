Import-Module xDSCResourceDesigner
$property = @()
$property += New-xDscResourceProperty -Name ThumbPrint -Type String -Attribute Key -Description "Thumbprint of target pfx."
$property += New-xDscResourceProperty -Name Ensure -Type String -Attribute Required -Description "Determine pfx to be import or not." -ValidateSet Present, Absent
$property += New-xDscResourceProperty -Name PfxFilePath -Type String -Attribute Write -Description "File path to the pfx."
$property += New-xDscResourceProperty -Name CertStoreLocation -Type String -Attribute Read -Description "Certification Store Location." -ValidateSet "LocalMachine"
$property += New-xDscResourceProperty -Name CertStoreName -Type String -Attribute Write -Description "Certification Store Name" -ValidateSet "AddressBook", "AuthRoot", "CertificateAuthority", "Disallowed", "My", "Root", "TrustedPeople", "TrustedPublisher"
$property += New-xDscResourceProperty -Name Credential -Type PSCredential -Attribute Write -Description "Specify Password to import pfx."

New-xDscResource -Name Grani_PfxImport -Property $property -Path .\ -ModuleName GraniResource -FriendlyName cPfxImport -Force