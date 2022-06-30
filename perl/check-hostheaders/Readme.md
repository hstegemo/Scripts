This is a script for finding hostheaders from the applicationHost.config files from Windows servers, and then use it to create a script that uses dig to find the IP-address for each hostheader. This dig script has to be run manually. I could have made it run automatically, but I want to be able to edit the script before it runs.

The script uses the sleep command, to keep it from using too much resoruces. 
