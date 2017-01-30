; Script generated by the HM NIS Edit Script Wizard.
; Forgive me, i am new at this. -- paul@cypherpunks.ca

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "otrproxy"
!define PRODUCT_VERSION "0.3.1"
!define PRODUCT_PUBLISHER "Cypherpunks CA"
!define PRODUCT_WEB_SITE "http://www.cypherpunks.ca/otr/"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "COPYING.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\README.txt"
!define MUI_FINISHPAGE_RUN "$INSTDIR\otrproxy.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "${PRODUCT_NAME}-${PRODUCT_VERSION}.exe"
InstallDir "$PROGRAMFILES\otrproxy"

ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01

	SetOutPath "$INSTDIR"
 
 SetOverwrite ifnewer
	File "README.Toolkit.txt"
	File "README.txt"
	File "COPYING.txt"
	File "COPYING.LIB.txt"
	File "otr_mackey.exe"
	File "otr_modify.exe"
	File "otr_parse.exe"
	File "otr_readforge.exe"
	File "otr_remac.exe"
	File "otr_sesskeys.exe"
	File "otrproxy.exe"
	File "otrproxy.nsi"
	File "mingwm10.dll"
 
SectionEnd

Section -AdditionalIcons
  CreateDirectory "$SMPROGRAMS\otrproxy"
  CreateShortCut "$SMPROGRAMS\otrproxy\Uninstall.lnk" "$INSTDIR\otrproxy-uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\otrproxy-uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\gaim-otr-uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
 
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\otrproxy.exe"
	Delete "$INSTDIR\README.Toolkit.txt"
	Delete "$INSTDIR\README.txt"
	Delete "$INSTDIR\COPYING.txt"
	Delete "$INSTDIR\COPYING.LIB.txt"
	Delete "$INSTDIR\otr_mackey.exe"
	Delete "$INSTDIR\otr_modify.exe"
	Delete "$INSTDIR\otr_parse.exe"
	Delete "$INSTDIR\otr_readforge.exe"
	Delete "$INSTDIR\otr_remac.exe"
	Delete "$INSTDIR\otr_sesskeys.exe"
	Delete "$INSTDIR\otrproxy.nsi"
	Delete /REBOOTOK "$INSTDIR\mingwm10.dll"

  Delete "$SMPROGRAMS\otrproxy\Uninstall.lnk"

  RMDir "$SMPROGRAMS\otrproxy"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"

SetAutoClose true
SectionEnd