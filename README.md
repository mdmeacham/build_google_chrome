# build_google_chrome
This is an **unsupported** script that automates the fetching of the latest Google Chrome browser and then the conversion to an IGEL OS custom partition.


## Dependencies

Script depends on the wget program for fetching the latest stable version of google chrome.  Before running this script, run:

``apt-get install wget``

## Use
Run build_google_chrome.sh with no aruguments.

When complete, you'll find a directory named results-<Chrome version> in your current working directory that contains the resulting CP, inf and profile.

