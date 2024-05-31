# homersync

A simple Bash script to back up your home folder to an external hard disk using `rsync`. This script includes features such as checking for the presence of `rsync`, verifying the availability of the backup directory, and excluding the `.cache` directory from the backup.

## Features

- Checks if `rsync` is installed, and installs it if necessary.
- Verifies if the backup directory (external hard disk) is mounted.
- Prompts the user for confirmation before proceeding with the backup.
- Excludes the `.cache` directory from the backup.
- Provides a verbose output of the backup process.

## Requirements

- Bash
- rsync
- An external hard disk mounted on your system

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/obionar/homersync.git
    cd homersync
    ```

2. Make the script executable:
    ```bash
    chmod +x homersync.sh
    ```

## Configuration

1. Open the `homersync.sh` file in a text editor:
    ```bash
    nano homersync.sh
    ```

2. Edit the `DEST_DIR` variable to specify your own destination for the backup directory or external drive. For example:
    ```bash
    DEST_DIR="/path/to/your/external/drive/homersync"
    ```

3. Save the file and exit the text editor.

## Usage

1. Ensure your external hard disk is mounted. For example, if it is mounted at `/mnt/external`.

2. Run the script:
    ```bash
    ./homersync.sh
    ```

3. Follow the on-screen prompts to confirm the backup process.

