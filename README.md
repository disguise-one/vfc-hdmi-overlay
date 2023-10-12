# HDMI VFC Driver Overlay (FT260)

## Installing the update
1. Download and unzip the kit provided above. It includes the devcon.exe CLI tool, and the overlay itself (VFC.inf)
2. Enter the folder with Administartor Powerhshell and execute the provided script to add the `vfc.inf` to the OEM driver store:
```
.\devcon.exe dp_add .\VFC.inf | Out-File -FilePath .\HDMI_Install_Log.txt -Append
```
3. This script will create a text file with the OEM store name of our installed INF to allow easy de-installation if any issues are faced, please see Uninstalling the update below. During the installation you will be prompted to trust the installation of the new overlay; please click OK. The script will also update the driver for devices currently installed in the system, if there are any (identified using their VID 0403 and PID 6030 under HI Devices in Device Manager.

3. If the installation completes correctly, the log will read "Drivers installed successfully".
4. Restart your machine. When re-booted ensure d3 manager recognises HDMI VFCs, and that apply feed settings works as expected.

## Verifying the update
Verify that the HDMI VFCs now display in Device Manager under ‘Human Interface Devices’ as ‘HDMI VFC’ or under a new ‘Disguise’ tab as ‘HDMI VFC’. 

Before the update they would have generic device handles with VID 0403 and PID 6030 visible in the Properties window.

## Uninstalling the update

In case of issues with the provided INF overlay update, a re-image can be performed, or the driver can be removed using the PnP utility and its OEM value, which is stored in the install log in the vfc-hdmi-overlay working directory. Please check this file, copy the related value (oemX.inf), and run the following command substituting X with your value: `pnputil /delete-driver oemX.inf /uninstall`
