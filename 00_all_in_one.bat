rem Install Chrome
echo "Install Chrome"
call batfiles\01_install_chrome\01_install_chrome.bat

rem Install RDC extention
echo "Install Chrome Remote Desktop Connection"
call batfiles\02_install_chrome_rdc\01_install_chrome_rdc.bat

rem Create Shortcut
echo "Create Shortcut in Desktop."
call batfiles\03_make_shortcut\01_create_shortcut.bat

echo "デスクトップの「リモートデスクトップ接続」をクリックしてください。"
