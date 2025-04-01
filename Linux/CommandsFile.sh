#!/bin/bash
#Most commonly used commands

# List files and directories in the current location
ls  

# List files with details (permissions, owner, size, modification time)
ls -l  

# List hidden files (files starting with ".")
ls -a  

# Show current working directory
pwd  

# Change directory (navigate to a folder)
cd /path/to/directory  

# Move up one directory level
cd ..  

# Go to the home directory
cd ~  

# Create a new file
touch filename.txt  

# Create a new directory (folder)
mkdir my_folder  

# Remove a file
rm filename.txt  

# Remove a directory and its contents
rm -r my_folder  

# Copy a file to another location
cp source.txt destination.txt  

# Copy a directory (recursively)
cp -r source_folder destination_folder  

# Move or rename a file/directory
mv oldname.txt newname.txt  

# View the contents of a file
cat filename.txt  

# Display file contents page by page
less filename.txt  

# Edit a file with Nano text editor
nano filename.txt  

# Create and write to a file (Ctrl+D to save)
cat > newfile.txt  

# Append text to an existing file
echo "New content" >> filename.txt  

# Display the first 10 lines of a file
head filename.txt  

# Display the last 10 lines of a file
tail filename.txt  

# Search for a word inside a file
grep "search_term" filename.txt  

# Find a file by name
find /path/to/search -name "filename.txt"  

# Display running processes
ps  

# Show real-time system processes
top  

# Clear the terminal screen
clear  

# Show disk usage in human-readable format
df -h  

# Show memory usage
free -h  

# Shutdown the system
sudo shutdown now  

# Reboot the system
sudo reboot  

# Display system logs (Ctrl+C to exit)
dmesg  

# Check network connectivity (Ctrl+C to stop)
ping google.com  

# Show the current user's username
whoami  

# Show all logged-in users
who  

# Create a new user (requires sudo)
sudo useradd -m newuser  

# Change the password for a user
sudo passwd newuser  

# Show file permissions
ls -l  

# Change file permissions (example: make it executable)
chmod +x script.sh  

# Change file owner (requires sudo)
sudo chown newowner filename.txt  

# Run a command as superuser
sudo command  

# Exit the terminal session
exit  