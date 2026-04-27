!define USER_DATA_DIR "$APPDATA\智方云cubecloud"
!define USER_DATA_BACKUP_ROOT "$APPDATA\智方云cubecloud-backup"

!macro preInit
  IfFileExists "${USER_DATA_DIR}\apps.json" preinit_backup 0
  IfFileExists "${USER_DATA_DIR}\icons\*.*" preinit_backup preinit_done

  preinit_backup:
    CreateDirectory "${USER_DATA_BACKUP_ROOT}"
    System::Call '*(&i2,&i2,&i2,&i2,&i2,&i2,&i2,&i2) p .r7'
    System::Call 'kernel32::GetLocalTime(p)i(r7)'
    System::Call '*$7(&i2 .r5,&i2 .r6,&i2 .r4,&i2 .r0,&i2 .r3,&i2 .r2,&i2 .r1,)'
    System::Free $7
    IntFmt $6 "%02d" $6
    IntFmt $0 "%02d" $0
    IntFmt $3 "%02d" $3
    IntFmt $2 "%02d" $2
    IntFmt $1 "%02d" $1
    StrCpy $9 "${USER_DATA_BACKUP_ROOT}\install-$5-$6-$0_$3-$2-$1"
    CreateDirectory "$9"
    IfFileExists "${USER_DATA_DIR}\apps.json" 0 +2
    CopyFiles /SILENT "${USER_DATA_DIR}\apps.json" "$9"
    IfFileExists "${USER_DATA_DIR}\icons\*.*" 0 preinit_done
    CreateDirectory "$9\icons"
    CopyFiles /SILENT "${USER_DATA_DIR}\icons\*.*" "$9\icons"

  preinit_done:
!macroend

!macro customUnInstall
  IfFileExists "${USER_DATA_DIR}\apps.json" uninstall_backup 0
  IfFileExists "${USER_DATA_DIR}\icons\*.*" uninstall_backup uninstall_done

  uninstall_backup:
    CreateDirectory "${USER_DATA_BACKUP_ROOT}"
    System::Call '*(&i2,&i2,&i2,&i2,&i2,&i2,&i2,&i2) p .r7'
    System::Call 'kernel32::GetLocalTime(p)i(r7)'
    System::Call '*$7(&i2 .r5,&i2 .r6,&i2 .r4,&i2 .r0,&i2 .r3,&i2 .r2,&i2 .r1,)'
    System::Free $7
    IntFmt $6 "%02d" $6
    IntFmt $0 "%02d" $0
    IntFmt $3 "%02d" $3
    IntFmt $2 "%02d" $2
    IntFmt $1 "%02d" $1
    StrCpy $9 "${USER_DATA_BACKUP_ROOT}\uninstall-$5-$6-$0_$3-$2-$1"
    CreateDirectory "$9"
    IfFileExists "${USER_DATA_DIR}\apps.json" 0 +2
    CopyFiles /SILENT "${USER_DATA_DIR}\apps.json" "$9"
    IfFileExists "${USER_DATA_DIR}\icons\*.*" 0 uninstall_done
    CreateDirectory "$9\icons"
    CopyFiles /SILENT "${USER_DATA_DIR}\icons\*.*" "$9\icons"

  uninstall_done:
!macroend