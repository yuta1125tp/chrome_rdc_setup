rem Install Chrome
echo "Install Chrome"
call 01_install_chrome.bat

rem Install RDC extention
echo "Install Chrome Remote Desktop Connection"
call 03_install_chrome_rdc.bat


rem Create Shortcut
echo "Create Shortcut in Desktop."
call 06_create_shortcuts.bat

echo "デスクトップの「リモートデスクトップ接続」をクリックしてください。"
