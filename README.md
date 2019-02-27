# Setting up the UTAX printer at NCT

[![Actions Status](https://wdp9fww0r9.execute-api.us-west-2.amazonaws.com/production/badge/soztag/printer)](https://github.com/soztag/printer/actions)

**This documentation lives on GitHub.
To raise issues or make changes, go to [`https://github.com/soztag/printer`](https://github.com/soztag/printer)**.

![xkcd 1343: *Manuals*](https://imgs.xkcd.com/comics/manuals.png)


## Connecting

There are three ways to connect to the printer:

1. `smb://wisoprint2.wiso.uni-erlangen.de/nct-aeg-11219-utax-3005ci` (**recommended** ethernet + `FAU.fm` WiFi)
2. `faui13printer.informatik.uni-erlangen.de` (ethernet only, for cryptology)
3. `10.26.63.77` (ethernet only, for SOZTAG)


## Setup

1. Go to [`http://www.utax.de`](http://www.utax.de) and download the driver for the printer.
  Navigate to `Download-Center > Treiber` (*yikes*, no permalink).
  The printer make is **UTAX 3005ci**.
  Choose as in the below screenshot.
  Download the most recent driver for your platform.  
  ![Download](https://github.com/soztag/printer/blob/master/download.png?raw=true){ width=50% }
2. Unzip the downloaded archive and install the driver.
3. Add the printer. 
    - Navigate to `Systems Preferences > Printers & Scanners` and click "plus".
    - For the **ethernet only** connections:
        - Choose the `IP` ribbon.
        - Fill in the address field (see above) and choose the UTAX driver.
          Replace the address in the below screenshot with the one that's right for you.  
          ![Installation](https://github.com/soztag/printer/blob/master/installation.png?raw=true){ width=50% }
    - For connections over **ethernet and WiFi** (via SMB printserver):
        - Right click on the area next to the search field and choose `Customize Toolbar`.  
          ![Toolbar 1](https://github.com/soztag/printer/blob/master/toolbar_1.png?raw=true){ width=50% }  
        - Drag the "Advanced" icon to the main ribbon.  
          ![Toolbar 2](https://github.com/soztag/printer/blob/master/toolbar_2.png?raw=true){ width=50% }  
        - Then choose advanced, and fill in the SMB address and choose the UTAX driver.  
          ![Wisoprint](https://github.com/soztag/printer/blob/master/wisoprint.png?raw=true){ width=50% }  
4. Change the page description language (PDL).
  Navigate to `Systems Preferences > Select PDL` and choose **PCL** as the PDL.
  **Do not skip this step**, or bad things (printed gibberish) may happen.  
  ![Installation](https://github.com/soztag/printer/blob/master/pdl.png?raw=true){ width=50% }
5. Save the job accounting number as a setting preset.
  This is where it gets weird.
    - Open a program with the *old* (< macOS 10.14.3), extensive print dialogue.
      Microsoft Word or Google Crome are a good bet.
      *You can't use Apple programs for this step, they all use the new print dialogue*.
    - Bring up the print menu. 
      Choose the newly installed printer in the dropdown.
    - *In* the print menu, choose the `Print Panel` in the dropdown.
      Click `Settings`.
      This will bring up TA_UTAX Print Panel application.
    - Inside that application, navigate to `Job > Job accounting` and fill in the **job accounting number** (~ Kostenstelle) for your organisation.  
      ![Job ID](https://github.com/soztag/printer/blob/master/job_id.png?raw=true){ width=50% }
    - While you're at it, you should also choose other sensible defaults to save paper and money (duplex printing, no color).  
      ![Saving](https://github.com/soztag/printer/blob/master/saving.png?raw=true){ width=50% }  
      Click ok.
    - Choose `Save Current Setting as Preset...` from the `Presets` dropdown in the print menu.  
      ![Set Presets](https://github.com/soztag/printer/blob/master/set_presets.png?raw=true){ width=50% }
    - Name the presets, and *apply them to `Only this printer`.*  
      ![Save Presets](https://github.com/soztag/printer/blob/master/save_presets.png?raw=true){ width=50% }
6. You should now be able to print from *any* application.
  Make sure to always choose the correct printer and presets.  
  ![Success!](https://github.com/soztag/printer/blob/master/success.png?raw=true){ width=50% }


## Reset

If you already *have* the printer installed, but it's not working right, consider deleting the printer and adding it again.

To do so on **macOS**:

1. Navigate to `Systems Preferences > Printers & Scanners`.
2. Choose the printer to be deleted.
3. Click delete.

![Deleting a printer](https://github.com/soztag/printer/blob/master/deletion.png?raw=true){ width=50% }

Then start the setup from scratch.


## Troubleshooting

- Consider reinstalling as per the above instructions.
- Raise an issue at `https://github.com/soztag/printer`.
- Contact the service provider, [MOG IT MBG](www.mog-online.de).
  The service ID for the printer is **4379**.
