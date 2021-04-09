Sets up a brand new WSL2 Ubunutu environment (Monitored Install)

To install:

1.  Install Git
 - sudo apt install git

2.  Generate a new SSH key
 - ssh-keygen -t ed25519 -C "your_email@example.com"
 - eval `ssh-agent -s`
 - ssh-add ~/.ssh/id_ed25519

3. Add the public SSH key to Github account

4. Clone this repository
 - git clone git@gthub.com:kconston/linux-settings.git

5. Run the setup script 
 - ./linux-settings/setup.sh -e "your_email@example.com" -f "Your fullname"

6. Provide input for all prompts

7. Once the script has completed restart WSL.  Environment should be set up.

