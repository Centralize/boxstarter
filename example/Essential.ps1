#Requires -version 3
#Requires -RunAsAdministrator

# Clear output console
Clear-Host

# Clean the powershell session
Get-PSSession | Remove-PSSession

# Change the current process policy to Unrestricted
Set-ExecutionPolicy Unrestricted -Scope Process -Force

# Profiles to install
$profiles = @(
    'Essential'
    #'Tools'
    #'DevCore'
    #'DevJava'
)

# Define options
$options = @(
    'Boxstarter::Begin=true'
    'Boxstarter::Begin::WindowsUpdate=false'

    'Boxstarter::End=true'
    'Boxstarter::End::WindowsUpdate=false'

    'Boxstarter::Essential::Privacy=true'
    'Boxstarter::Essential::Security=true'
    'Boxstarter::Essential::Service=true'
    'Boxstarter::Essential::UI=true'
    'Boxstarter::Essential::UI-Preferences=true'
    'Boxstarter::Essential::Application=true'
    'Boxstarter::Essential::RemoteDesktop=true'
    'Boxstarter::Essential::InternetExplorerESC=true'
    'Boxstarter::Essential::TaskbarOptions=true'
    'Boxstarter::Essential::CornerNavigationOptions=true'
    'Boxstarter::Essential::Windows-Update=true'
    'Boxstarter::Essential::Disable-BingSearch=true'
    'Boxstarter::Essential::Disable-GameBarTips=true'
    'Boxstarter::Essential::Disable-XboxGamebar=true'
    'Boxstarter::Essential::Remove-Apps=true'
    'Boxstarter::Essential::Remove::Microsoft.OneDrive=true'
)

# Download my boxstarter bootstrap
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/AbsCoDes/boxstarter/master/boxstarter.ps1' -OutFile "$($env:temp)\boxstarter.ps1"

# Start the setup process
&Invoke-Command -ScriptBlock {
    &"$($env:temp)\boxstarter.ps1" -profiles $profiles -options $options
}
