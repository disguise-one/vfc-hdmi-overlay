# HDMI VFC Driver Overlay (FT260)

## Installing the update
1. Download and unzip the kit provided above. It includes the devcon.exe CLI tool, and the overlay itself (VFC.inf)
2. Enter the folder with Administartor Powerhshell and execute the following command to add the `vfc.inf` to the OEM driver store:
```
.\devcon.exe dp_add .\VFC.inf | Out-File -FilePath C:\Users\d3\Desktop\HDMI_VFC_INF_VAL.txt
```
Additionally, this command will create a text file with the OEM store name of our installed INF to allow easy de-installation if any issues are faced, please see Uninstalling the update below.

3. You will be prompted to trust the installation of the new overlay, please click OK.
4. Next, to update the driver for devices currently installed in the system run the following command:
```
.\devcon.exe update .\VFC.inf "USB\VID_0403&PID_6030"
```

5. This should finish with the line “Drivers installed succesfully" after which the machine should be restarted. 
6. Post-restart, perform an apply feed settings on relevant HDMI VFC outs to ensure normal operation

## Verifying the update
Verify that the HDMI VFCs now display in Device Manager under ‘Human Interface Devices’ as ‘HDMI VFC’ or under a new ‘Disguise’ tab as ‘HDMI VFC’. 

Before the update they would have generic device handles with VID 0403 and PID 6030 visible in the Properties window.

## Uninstalling the update
In case of issues with the provided INF overlay update, a re-image can be performed, or the driver can be removed using the PnP utility and its OEM value, which was stored in Step 2 of the previous instructions in a file called HDMI_VFC_INF_VAL.txt on the desktop.

Please check this file, copy the related value (oemX.inf) and run the following command substituting X with your value: `pnputil /delete-driver oemX.inf /uninstall`
