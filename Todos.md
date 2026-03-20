# Global TODOs

## TOC
1. [Rosebank](#rosebank)
2. [AkerBP Tilje](#akerbp-tilje)
3. [General](#general)

---

## ROSEBANK
* [x] get skandi africa RAO model
* [x] set the CW landing model
    * [x] get the wetstorage model
    * [x] get the geometry of the set from TPFMC report
    * [x] reproduce the geoometry
    * [x] compare loads / statis for now
    * [x] compare MBR - what kind of stiffness is TPFMC using
    * [x] add the BS at tether
* [x] make presentation of the results
* [ ] TODO review transpooling report
* [x] run dynamic analysis over the weekend
    * [x] The curretn with 180deg has a problem, the MBR is reached even in static analysis
    * [x] IMPORTANT need to check what is the bending stiffness used in technips analysis
    * [x] ran the 180 P90 current ignoring the MBR close to the HDC, it seems to match fairly well the results from Technip
    * [x] running the P70 now, ignoring the MBR as well, because the MBR is reached even in static.

## Results
NOTE
* [ ] I could verify technips results more or less
    - the difference in static MBR is important to the sea states since this is the critical variable as far as could see
* [ ] increasing the MBR does not improve the results
    - this is due to the fact that the line becomes more horizontal and therefor more sensitive to the load of the CW
* [ ]  on the other hand, results pending, but decreasing the layback seems to improve the MBR, we will see how the compression  works

### Notes
 - dynamic step is actually step 23
 - NOTE We have lower MBR, which I think is due to the lack of BS at the tether
 - NOTE adding the bend stiffener does not improve the MBR, only moves it to the tip of the BS.
 * [x] IMPORTANT TODO check what is the bending stiffness for the production riser that Technip is using.

---

## AkerBP Tilje
* [ ] [Project TODOs](<C:/Users/joaop/OneDrive - KONGSBERG/00_Projects/08_AkerBP_Tilje/TODOs.md>)
* [x] go throught all data and record whats missing
* [x] email sent with the missing data
* [x] IMPORTANT Start build the model -> make sure I do it today
* [x] prepare a slide deck for tomorrow meeting

---

## General
* [x] help houston to make the uflex runs
* [x] wrong cross section -> need to run the bottom
    * [x] Re-run the top x-section with more steps
* [ ] TODO Bandibuli -> update the local report with the 45deg analysis for the armor wires
    * [x]  right now I am not matching the 45deg temp test, need to reduce the bending stiffnes of the outer sheath
    NOTE I have the correct ffl and it matches more of less the bending test - up to a certain curvature that is
* [x] help houston in the revision of the Hammerhead umbilical
* [x] Finish the Troll C proposal
* [x] Check the proposal for JDR Jotun

