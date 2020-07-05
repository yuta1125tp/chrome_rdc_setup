# [PSBrowserExtensions](https://bitbucket.org/svalding/psbrowserextensions/src/master/)  
# [Chrome Remote Desktop](https://chrome.google.com/webstore/detail/chrome-remote-desktop/inomeogfingihgjfjlpeplalcfajhgai)
Import-Module ..\..\psbrowserextensions\New-ChromeExtension.ps1
New-ChromeExtension -ExtensionID 'inomeogfingihgjfjlpeplalcfajhgai' -Verbose -Hive User
Remove-Module New-ChromeExtension
