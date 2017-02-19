Python Variant may be worked on but should be based on finalized versions, not the work leading up to a new version.

We would like to create two main adaptations, aside from the master done in Bash:

1) Python adaptation

2) Education adaptation, in Bash script, identical to Bash master except that it explains each command and requires user 
   to hit enter to run the commands. (Commented to death with pauses so new users can see what's happening, read the 
   explanation, and learn)

3) While v1.0 of this script isn't in wide use, all changes that alter the settings, alter installed packages, or files on the system, and do not simply add new functions, must be integrated into the version update function for each version. Use tests to verify that the changes need to be made. For testing purposes, v1.0 can be made available.

4) Each new complete version must have it's own entry in the version update function, to ensure compatibility and smooth transitioning.

5) Regardless of version or adaption, please follow thorough commenting conventions.

6) The main idea I began with for this was to keep the commands and structure simple, and easy to troubleshoot, whether during testing or during use. Please maintain this regardless of version or adaptation. If a series of commands can be done in a single line, but would be difficult to understand for those who aren't overly familiar with bash or python, please branch it out so that it can be followed easily step by step. I've tried to maintain this throughout, and can currently think of only one instance where this is not done, which is the command to clean old kernel files during the system cleanup function, if you need an example of the complicated methods to avoid.

7) If any code is pulled or adapted from another author, please site their work. I'll be doing this for the current code soon, and the citations should be placed in CONTRIBUTIONS.MD.
