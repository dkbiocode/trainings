# Connecting VS Code to AWS EC2 Instance

This guide shows you how to connect your local VS Code installation to a remote AWS EC2 instance for workshop exercises.

## Prerequisites

- VS Code installed on your local computer
- SSH access to an AWS EC2 instance
- SSH key file (`.pem` file) provided by your instructor

## Step 1: Install the Remote-SSH Extension

1. Open VS Code on your local computer
2. Click the Extensions icon in the Activity Bar (left side), or press `Cmd+Shift+X` (Mac) / `Ctrl+Shift+X` (Windows/Linux)
3. Search for "Remote - SSH"
4. Install the extension published by Microsoft

![Remote-SSH Extension](../img/remote-ssh-extension.png)

## Step 2: Set Up Your SSH Key

You'll need to configure your SSH key to connect to the EC2 instance.

### Mac/Linux:

1. Create the `.ssh` directory if it doesn't exist:
   ```bash
   mkdir -p ~/.ssh
   ```

2. Copy your SSH key file (e.g., `metagenomics-key.pem`) to the `.ssh` directory:
   ```bash
   cp /path/to/your/metagenomics-key.pem ~/.ssh/
   ```

3. Set the correct permissions (required for SSH to work):
   ```bash
   chmod 600 ~/.ssh/metagenomics-key.pem
   ```

### Windows:

1. Create the `.ssh` directory in your user folder if it doesn't exist:
   ```
   C:\Users\YourUsername\.ssh\
   ```

2. Copy your SSH key file to this directory

3. Right-click the key file → Properties → Security tab → Advanced
   - Disable inheritance
   - Remove all users except your own user account
   - Ensure your account has "Read" permission only

## Step 3: Configure SSH Connection

You'll add connection details to your SSH config file to make connecting easier.

1. In VS Code, press `Cmd+Shift+P` (Mac) / `Ctrl+Shift+P` (Windows/Linux) to open the Command Palette

2. Type "Remote-SSH: Open SSH Configuration File" and select it

3. Choose your SSH config file (usually `~/.ssh/config` or `C:\Users\YourUsername\.ssh\config`)

4. Add the following configuration (replace values as needed):

   ```
   Host aws-workshop
       Hostname ec2-XX-XXX-XXX-XX.compute-1.amazonaws.com
       User ubuntu
       IdentityFile ~/.ssh/metagenomics-key.pem
   ```

   **Important:** Replace the following:
   - `ec2-XX-XXX-XXX-XX.compute-1.amazonaws.com` with the hostname provided by your instructor
   - `metagenomics-key.pem` with the name of your SSH key file
   - `ubuntu` with the username if different (common values: `ubuntu`, `ec2-user`)

5. Save the file (`Cmd+S` / `Ctrl+S`)

### Example Configuration

Here's a complete example:

```
Host aws-workshop
    Hostname ec2-34-228-219-65.compute-1.amazonaws.com
    User ubuntu
    IdentityFile ~/.ssh/metagenomics-key.pem
```

The `Host` name (`aws-workshop` in this example) is a shortcut you'll use to connect. You can name it anything you like.

## Step 4: Start the EC2 Instance

**Note:** EC2 instances may be stopped when not in use to save costs. Your instructor will tell you if you need to start the instance.

If you need to start the instance:
- Contact your instructor, or
- If you have AWS console access, start it from the EC2 dashboard

Wait for the instance to be in "running" state before connecting.

## Step 5: Connect to the Remote Instance

1. Click the green Remote indicator in the bottom-left corner of VS Code (looks like `><`)

   ![Remote Indicator](../img/remote-indicator.png)

2. Select "Connect to Host..." from the menu

3. Select your configured host (e.g., `aws-workshop`)

4. If prompted, select the platform of the remote host: **Linux**

5. VS Code will open a new window and connect to the remote instance

6. You may see a notification "Setting up SSH Host..." - wait for this to complete

7. Once connected, the green indicator will show your hostname (e.g., `><` `SSH: aws-workshop`)

## Step 6: Open Your Workshop Directory

Once connected to the remote instance:

1. Click File → Open Folder... (or press `Cmd+O` / `Ctrl+O`)

2. Navigate to your workshop directory (e.g., `/home/ubuntu/workshops-unified/` or similar)

3. Click "OK"

4. If prompted, select "Yes, I trust the authors"

You're now ready to work with the workshop materials on the remote instance!

## Step 7: Open a Terminal

1. In VS Code, open the Panel by clicking View → Terminal (or press `` Ctrl+` ``)

2. You'll see a terminal connected to the remote EC2 instance

3. Verify you're in the right place:
   ```bash
   pwd
   whoami
   ```

## Troubleshooting

### Connection Timeout

- Verify the EC2 instance is running
- Check that the hostname in your SSH config is correct
- Verify your SSH key file path is correct
- Ensure your SSH key has the correct permissions (`chmod 600`)

### "Permission denied (publickey)"

- Check that your `IdentityFile` path points to the correct key file
- Verify the key file permissions: `ls -l ~/.ssh/metagenomics-key.pem` should show `-rw-------`
- Confirm you're using the correct username (`ubuntu`, `ec2-user`, etc.)

### "Host key verification failed"

- This can happen if the EC2 instance was recreated with a new IP address
- Remove the old entry: `ssh-keygen -R ec2-XX-XXX-XXX-XX.compute-1.amazonaws.com`
- Try connecting again

### Can't Find SSH Config File

If you don't have an SSH config file:

**Mac/Linux:**
```bash
touch ~/.ssh/config
chmod 644 ~/.ssh/config
```

**Windows (PowerShell):**
```powershell
New-Item -ItemType File -Path $env:USERPROFILE\.ssh\config -Force
```

## Working with Files

Once connected, you can:

- Edit files directly on the remote instance
- Use the integrated terminal to run commands
- Install VS Code extensions on the remote instance
- Open multiple terminal tabs

All your work is saved on the remote instance, not your local computer.

## Disconnecting

To disconnect from the remote instance:

1. Click the green remote indicator (`><` `SSH: aws-workshop`) in the bottom-left corner
2. Select "Close Remote Connection"

Or simply close the VS Code window.

## Tips

- **Reconnecting:** Use the same steps in Step 5 to reconnect anytime
- **Multiple terminals:** Click the `+` icon in the Terminal panel to open additional terminals
- **File navigation:** Use the Explorer in the Primary Side Bar to browse files
- **Stopping the instance:** If you have AWS access, remember to stop the instance when done to avoid charges

## Additional Resources

- [VS Code Remote-SSH Documentation](https://code.visualstudio.com/docs/remote/ssh)
- [AWS EC2 User Guide](https://docs.aws.amazon.com/ec2/index.html)
