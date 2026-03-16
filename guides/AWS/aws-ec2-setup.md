# Setting Up AWS EC2 Instance for Workshops

This guide walks through creating and configuring an AWS EC2 instance for running workshop materials. This provides a cloud-based alternative to GitHub Codespaces or local setup.

## Overview

This guide documents the complete setup process for creating a dedicated AWS EC2 instance that can run workshop exercises. The instance includes:
- Ubuntu 22.04 LTS
- Docker for containerization
- Sufficient compute resources for bioinformatics workflows
- Remote access via SSH and VS Code

**Cost Estimate:**
- Running: ~$7.22/day (t3a.2xlarge, 24/7)
- Stopped: ~$0.15/day (storage only)
- Monthly (if stopped when not in use): ~$5/month

## Prerequisites

Before starting, you'll need:
- An AWS account with billing enabled
- Basic familiarity with the AWS Console
- A credit card on file with AWS
- SSH client on your local computer

## Part 1: Create IAM User (One-Time Setup)

For security, create a dedicated IAM user instead of using your root account for daily operations.

### Step 1: Sign in to AWS Console

1. Go to https://console.aws.amazon.com/
2. Sign in with your root account credentials

### Step 2: Create IAM User

1. Navigate to **IAM Dashboard**: https://console.aws.amazon.com/iam/
2. Click **Users** in left sidebar → **Create user**
3. **User name:** `admin` (or your preferred name)
4. Click **Next**
5. **Permissions:** Select "Attach policies directly"
6. Search for and select: **AdministratorAccess**
7. Click **Next** → **Create user**

### Step 3: Create Console Password

1. Click on the newly created user (`admin`)
2. Go to **Security credentials** tab
3. Under **Console sign-in**, click **Enable console access**
4. Choose **Custom password** and set a strong password
5. **Uncheck** "User must create a new password at next sign-in" (optional)
6. Click **Apply**

### Step 4: Create Access Keys (for AWS CLI)

If you plan to use the AWS CLI:

1. Still in **Security credentials** tab
2. Scroll to **Access keys** → **Create access key**
3. Select use case: **Command Line Interface (CLI)**
4. Check "I understand..." → Click **Next**
5. (Optional) Add description tag
6. Click **Create access key**
7. **IMPORTANT:** Download the `.csv` file or copy both:
   - Access key ID
   - Secret access key
   - Store these securely (password manager recommended)
8. Click **Done**

### Step 5: Note Your Account ID

1. Click your account name in top-right corner
2. Note your **Account ID** (12-digit number)
3. Save this - you'll need it to sign in as IAM user

### Step 6: Sign Out and Sign Back In as IAM User

1. Sign out from root account
2. Go to https://console.aws.amazon.com/
3. Select **IAM user** sign-in
4. Enter your **Account ID** (or account alias if you set one)
5. Username: `admin`
6. Password: (the password you created)

**Going forward, always use this IAM user account, not root.**

## Part 2: Launch EC2 Instance

### Step 1: Choose Your Region

1. In top-right corner of AWS Console, click the region dropdown
2. Select a region close to you (e.g., **us-east-1** for US East Coast)
3. Stay in this region for all resources

### Step 2: Navigate to EC2

1. Go to **EC2 Dashboard**: https://console.aws.amazon.com/ec2/
2. Click **Launch instance** (orange button)

### Step 3: Configure Instance

Fill in the launch instance form:

#### Name and Tags
- **Name:** `metagenomics-training` (or your preferred name)

#### Application and OS Images (AMI)
- Click **Quick Start** tab
- Select **Ubuntu**
- Choose: **Ubuntu Server 22.04 LTS (HVM), SSD Volume Type**
- Architecture: **64-bit (x86)**
- Keep the default AMI (usually ami-xxxxxxxxx)

#### Instance Type

Choose based on your needs:

| Instance Type | Architecture | vCPUs | RAM | Cost/hour | Best For |
|--------------|-------------|-------|-----|-----------|----------|
| m6a.4xlarge | AMD x86_64 | 16 | 64 GB | ~$0.69 | Fastest option, large datasets |
| **t3a.2xlarge** (recommended) | AMD x86_64 | 8 | 32 GB | ~$0.30 | Full workshop, good balance of speed & cost |
| t3a.xlarge | AMD x86_64 | 4 | 16 GB | ~$0.15 | Full workshop, moderate speed |
| t3a.large | AMD x86_64 | 2 | 8 GB | ~$0.08 | Works but slower for assembly |
| t3a.medium | AMD x86_64 | 2 | 4 GB | ~$0.04 | Testing only, NOT for assembly |

**Select:** `t3a.2xlarge`

**Pricing reference:** Current as of March 2026. See [AWS EC2 Pricing](https://aws.amazon.com/ec2/pricing/on-demand/) or [EC2 Instance Comparison](https://instances.vantage.sh/) for latest rates.

#### Understanding Instance Architecture (x86_64, AMD, ARM)

AWS offers instances with different CPU architectures. Here's what you need to know:

**x86_64 Architecture (Recommended for Bioinformatics):**
- **What it is:** The standard 64-bit Intel/AMD processor architecture
- **Intel instances:** m5, m6i, t3, c5, c6i, r5 (no suffix)
- **AMD instances:** t3a, m5a, m6a, c5a, c6a (has "a" suffix)
- **Compatibility:** Intel and AMD x86 are fully compatible - software runs identically on both
- **For this workshop:** All recommended instances (t3a, m6a) use AMD x86_64

**ARM Architecture (Graviton):**
- **What it is:** ARM-based processors (AWS Graviton2/Graviton3)
- **Instance families:** t4g, m6g, m7g, c6g, c7g (has "g" suffix)
- **Advantage:** 10-20% cheaper, better power efficiency
- **Disadvantage:** Limited bioinformatics software support via conda/micromamba

**Why We Recommend x86_64 for Bioinformatics:**

1. **Package availability:** Most bioconda packages are compiled for x86_64
2. **Compatibility:** Tools like SPAdes, Trimmomatic, FastQC are well-tested on x86
3. **Reliability:** Less risk of "package not found" errors or architecture-specific bugs
4. **Community support:** Better troubleshooting resources for x86 platforms

**AMD vs Intel x86:**
- Both are x86_64 architecture - fully interchangeable
- AMD instances (t3a, m6a) are ~10% cheaper than equivalent Intel (t3, m6)
- Conda/micromamba packages work identically on both
- **Recommendation:** Use AMD instances for better value

**Bottom line:** Stick with x86_64 instances (Intel or AMD) for bioinformatics workflows. The instances recommended in this guide are all AMD x86_64, providing the best balance of compatibility and cost.

#### Key Pair (Login)

Create a new SSH key pair:

1. Click **Create new key pair**
2. **Key pair name:** `metagenomics-key` (or your preferred name)
3. **Key pair type:** RSA
4. **Private key file format:**
   - **.pem** (for Mac/Linux)
   - **.ppk** (for Windows with PuTTY)
5. Click **Create key pair**
6. **The .pem file will download automatically** - save it securely!

#### Network Settings

1. Click **Edit** to customize
2. **Firewall (security groups):** Select "Create security group"
3. **Security group name:** `metagenomics-sg`
4. **Description:** `Security group for metagenomics training`

Add the following rules (click **Add security group rule** for each):

**Rule 1: SSH**
- Type: SSH
- Protocol: TCP
- Port: 22
- Source type: My IP
- (AWS will auto-detect your current IP)

**Rule 2: VS Code Server (if using code-server)**
- Type: Custom TCP
- Protocol: TCP
- Port range: 8080
- Source type: My IP

**Rule 3: RStudio Server (optional)**
- Type: Custom TCP
- Protocol: TCP
- Port range: 8787
- Source type: My IP

**Security Note:** Using "My IP" restricts access to only your current IP address. This is more secure than "Anywhere" (0.0.0.0/0).

#### Configure Storage

1. **Size:** `50` GiB (minimum for workshop data + tools)
2. **Volume type:** gp3 (General Purpose SSD - good balance of cost and performance)
3. **Delete on termination:** Checked (default)

Leave other storage settings as default.

#### Advanced Details

Leave as defaults (scroll down to expand if curious, but no changes needed).

### Step 4: Review and Launch

1. Review your configuration in the **Summary** panel (right side)
2. Click **Launch instance** (orange button)
3. You'll see "Successfully initiated launch of instance i-xxxxxxxxx"
4. Click the instance ID link or click **View all instances**

### Step 5: Wait for Instance to Start

1. In the **Instances** view, find your instance
2. Wait for:
   - **Instance state:** Running (green)
   - **Status check:** 2/2 checks passed (may take 2-3 minutes)
3. Note the **Public IPv4 address** (e.g., `3.87.250.36`)

**Important:** This IP address will change if you stop and restart the instance. You can allocate an Elastic IP (static) if you need a permanent IP, but this incurs a small charge when the instance is stopped.

## Part 3: Set Up SSH Access

### Step 1: Secure Your SSH Key

On your **local computer**:

**Mac/Linux:**
```bash
# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh

# Move the downloaded key file to .ssh directory
mv ~/Downloads/metagenomics-key.pem ~/.ssh/

# Set correct permissions (required - SSH will refuse to work without this)
chmod 400 ~/.ssh/metagenomics-key.pem

# Verify permissions
ls -l ~/.ssh/metagenomics-key.pem
# Should show: -r-------- ... metagenomics-key.pem
```

**Windows:**
1. Move the key file to: `C:\Users\YourUsername\.ssh\`
2. Right-click the file → Properties → Security tab → Advanced
3. Click "Disable inheritance" → "Remove all inherited permissions"
4. Click "Add" → "Select a principal" → enter your username → OK
5. Check "Read" permission only → OK

### Step 2: Test SSH Connection

**Mac/Linux:**
```bash
# Replace YOUR_IP with your instance's public IPv4 address
ssh -i ~/.ssh/metagenomics-key.pem ubuntu@YOUR_IP
```

**Windows (PowerShell):**
```powershell
ssh -i C:\Users\YourUsername\.ssh\metagenomics-key.pem ubuntu@YOUR_IP
```

**First connection:** You'll see a message about host authenticity:
```
The authenticity of host '3.87.250.36 (3.87.250.36)' can't be established.
...
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```
Type `yes` and press Enter.

**Successful connection looks like:**
```
Welcome to Ubuntu 22.04.3 LTS (GNU/Linux 6.2.0-1009-aws x86_64)
...
ubuntu@ip-172-31-47-137:~$
```

You're now connected to your EC2 instance!

### Step 3: (Optional) Configure SSH Config File

To make connecting easier, add an entry to your SSH config:

**Mac/Linux:**
```bash
# Edit or create SSH config
nano ~/.ssh/config
```

Add this entry (replace hostname with your instance's IP):
```
Host aws-workshop
    Hostname YOUR_INSTANCE_IP
    User ubuntu
    IdentityFile ~/.ssh/metagenomics-key.pem
```

Save and exit (`Ctrl+X`, `Y`, `Enter` in nano).

Now you can connect with just:
```bash
ssh aws-workshop
```

**Note:** Remember to update the Hostname if your IP changes after stopping/starting the instance.

## Part 4: Install Docker

Now that you're connected to your EC2 instance, install Docker.

```bash
# Update package index
sudo apt-get update

# Install prerequisites
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add ubuntu user to docker group (avoid needing sudo for docker commands)
sudo usermod -aG docker ubuntu

# Log out and back in for group membership to take effect
exit
```

**Log back in via SSH:**
```bash
ssh -i ~/.ssh/metagenomics-key.pem ubuntu@YOUR_IP
# or if you set up SSH config:
ssh aws-workshop
```

**Verify Docker installation:**
```bash
docker run hello-world
```

You should see: "Hello from Docker! This message shows that your installation appears to be working correctly."

## Part 5: Clone Workshop Repository

```bash
# Clone the repository
cd ~
git clone https://github.com/dkbiocode/trainings.git

# Navigate to the repository
cd trainings

# List contents to verify
ls
```

## Part 6: Pull Docker Image (If Using Containers)

If your workshop uses a pre-built Docker image:

```bash
# Pull the workshop Docker image
docker pull ghcr.io/meekrob/workshop-codespace-image:latest
```

This may take several minutes depending on image size and connection speed.

## Part 7: Install Workshop Tools

Depending on your workshop needs, you may need to install additional tools. Here are common options:

### Option A: Using Micromamba (Recommended)

If your Docker image includes micromamba:

```bash
# Run container interactively
docker run -it --rm ghcr.io/meekrob/workshop-codespace-image:latest bash

# Inside container, install packages with micromamba
micromamba install -n metagenomics fastqc trimmomatic spades -c bioconda -c conda-forge
```

### Option B: Install Tools Directly on EC2 (Without Docker)

If you prefer not to use Docker:

```bash
# Install Miniconda
cd /tmp
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda3

# Initialize conda
$HOME/miniconda3/bin/conda init bash
source ~/.bashrc

# Create conda environment with workshop tools
conda create -n workshop -y -c bioconda -c conda-forge \
    python=3.9 \
    fastqc \
    trimmomatic \
    spades

# Activate environment
conda activate workshop

# Verify installation
fastqc --version
```

## Part 8: Access Your Instance from VS Code

See the companion guide: **[Connecting VS Code to AWS EC2 Instance](aws-remote-connection.md)**

This guide covers:
- Installing Remote-SSH extension
- Configuring SSH connection
- Connecting VS Code to your instance
- Working with files remotely

## Managing Your Instance

### Starting and Stopping

**To save money, stop your instance when not in use.**

#### Via AWS Console:

1. Go to **EC2 Dashboard** → **Instances**
2. Select your instance (checkbox)
3. Click **Instance state** dropdown (top-right)
4. Choose **Stop instance** or **Start instance**

#### Via AWS CLI (if configured):

```bash
# Stop instance
aws ec2 stop-instances --instance-ids i-YOUR_INSTANCE_ID

# Start instance
aws ec2 start-instances --instance-ids i-YOUR_INSTANCE_ID

# Check status
aws ec2 describe-instances --instance-ids i-YOUR_INSTANCE_ID \
  --query 'Reservations[0].Instances[0].[State.Name,PublicIpAddress]' \
  --output table
```

**Find your instance ID:**
- In EC2 Console: Instances → your instance → Instance ID column (starts with `i-`)
- Or: `cat ~/metagenomics-instance-id.txt` if you saved it

### Getting Current IP Address

After stopping and restarting, your public IP will change.

**Via AWS Console:**
1. EC2 Dashboard → Instances
2. Select your instance
3. Look at **Public IPv4 address** in Details tab (bottom panel)

**Via AWS CLI:**
```bash
aws ec2 describe-instances --instance-ids i-YOUR_INSTANCE_ID \
  --query 'Reservations[0].Instances[0].PublicIpAddress' \
  --output text
```

**Update your SSH config:** Edit `~/.ssh/config` with the new IP address.

### Terminating Instance (Permanent Deletion)

**WARNING:** Terminating deletes your instance and all data permanently!

Only do this when completely done:

1. EC2 Dashboard → Instances
2. Select instance → Instance state → Terminate instance
3. Confirm termination

**Before terminating:**
- Save any important data elsewhere
- Consider creating an AMI snapshot instead (see below)

## Creating an AMI (Template for Others)

Once you have your instance fully configured, you can create an Amazon Machine Image (AMI) that others can use to launch identical instances.

### Step 1: Create AMI from Your Instance

1. EC2 Dashboard → Instances
2. Select your configured instance
3. Click **Actions** → **Image and templates** → **Create image**
4. **Image name:** `metagenomics-workshop-v1` (or your preferred name)
5. **Image description:** "Configured instance for metagenomics workshop with Docker, tools, and data"
6. Leave other settings as default
7. Click **Create image**

The AMI creation takes several minutes. Monitor progress: **EC2 Dashboard → AMIs** (left sidebar).

### Step 2: Make AMI Public (Optional)

To share with others:

1. EC2 Dashboard → AMIs
2. Select your AMI
3. Click **Actions** → **Edit AMI permissions**
4. Choose:
   - **Private** (default) - only you can use it
   - **Public** - anyone with AWS can launch instances from it
   - **Specific AWS accounts** - share with specific account IDs
5. Click **Save changes**

### Step 3: Share AMI ID

Share the AMI ID (starts with `ami-`) with others. They can:

1. Go to EC2 Dashboard → Launch instance
2. Click **My AMIs** or **Community AMIs** (if public)
3. Search for your AMI ID
4. Select it and continue with instance launch

**Cost Note:** Storing an AMI costs ~$0.05/GB/month. A 50GB image = ~$2.50/month.

## Cost Management

### Monitor Costs

**AWS Billing Dashboard:** https://console.aws.amazon.com/billing/

**Set up billing alerts:**
1. Billing Dashboard → Billing preferences
2. Enable "Receive Billing Alerts"
3. Save preferences
4. Go to CloudWatch → Alarms → Create alarm
5. Set threshold (e.g., $10, $25, $50)
6. Enter email for notifications

### Cost Estimates (t3a.2xlarge)

| Usage Pattern | Daily Cost | Monthly Cost |
|--------------|-----------|--------------|
| Running 24/7 | ~$7.22 | ~$220 |
| Running 8 hrs/day | ~$2.41 | ~$72 |
| Stopped (storage only) | ~$0.15 | ~$5 |

**Savings strategy:**
- Stop instance when not in use
- For breaks > 1 month: create AMI snapshot, terminate instance
- Restore from AMI when needed

## Troubleshooting

### Cannot SSH to Instance

**Check 1: Is instance running?**
- EC2 Dashboard → Instances → Instance state should be "Running"
- Status checks should show "2/2 checks passed"

**Check 2: Security group**
- EC2 Dashboard → Instances → Select instance → Security tab
- Inbound rules should include SSH (port 22) from your IP
- If your IP changed, update the security group rule

**Check 3: Key file permissions**
```bash
ls -l ~/.ssh/metagenomics-key.pem
# Should show: -r-------- (400 permissions)

# Fix if needed:
chmod 400 ~/.ssh/metagenomics-key.pem
```

**Check 4: Correct username**
- Ubuntu AMI uses username: `ubuntu`
- Amazon Linux uses: `ec2-user`
- Check the AMI documentation for other distributions

### Docker Permission Denied

```bash
# Check if user is in docker group
groups
# Should include "docker"

# If not, add user and re-login
sudo usermod -aG docker ubuntu
exit
# SSH back in
```

### Instance Running But Can't Access Services

**Check security group rules:**
- Port 8080 (code-server): needs inbound rule
- Port 8787 (RStudio): needs inbound rule
- Source should be "My IP" or your current IP

**Update security group:**
1. EC2 Dashboard → Security Groups
2. Select `metagenomics-sg`
3. Inbound rules tab → Edit inbound rules
4. Add or modify rules as needed

### IP Address Changed

This is normal after stop/start.

**Get new IP:**
- EC2 Dashboard → Instances → Public IPv4 address

**Update SSH config:**
```bash
nano ~/.ssh/config
# Update the Hostname line with new IP
```

**Alternative: Use Elastic IP (static IP)**
1. EC2 Dashboard → Elastic IPs → Allocate Elastic IP address
2. Select the new IP → Actions → Associate Elastic IP address
3. Choose your instance → Associate

**Note:** Elastic IPs are free while associated with a running instance, but cost ~$0.005/hour when NOT associated or instance is stopped.

## Security Best Practices

1. **Use IAM user, not root account**
2. **Restrict security groups to your IP** (not 0.0.0.0/0)
3. **Keep SSH key secure** (never commit to git, never share)
4. **Enable MFA** on your IAM user (in IAM Dashboard → Users → Security credentials)
5. **Rotate access keys** every 90 days
6. **Use strong passwords** for any services (code-server, RStudio, etc.)
7. **Keep instance updated:** `sudo apt-get update && sudo apt-get upgrade`
8. **Stop instance when not in use** (security + cost savings)

## Additional Resources

- [AWS EC2 User Guide](https://docs.aws.amazon.com/ec2/)
- [AWS Free Tier](https://aws.amazon.com/free/) - 750 hours/month of t2.micro (12 months for new accounts)
- [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- [AWS Cost Calculator](https://calculator.aws/)
- [Connecting VS Code to AWS EC2](aws-remote-connection.md) - Companion guide

## Summary

You now have a fully configured AWS EC2 instance for running workshops!

**Next steps:**
1. Connect via SSH or VS Code Remote-SSH
2. Follow workshop lessons
3. Stop instance when done to save money
4. (Optional) Create AMI to share with others

**Remember:** Always stop your instance when not in use to minimize costs!
