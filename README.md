# Project Title: SSHDucky - Raspberry Pi Pico USB Rubber Ducky

## Project Abstract
SSHDucky is a project that utilizes the Raspberry Pi Pico microcontroller to create a USB Rubber Ducky device. This device emulates a keyboard and provides a quick SSH connection to an attacker's machine within just 30 seconds.

## Installation

Follow the steps below to set up the SSHDucky project:

**Step 1: Setup the Pi Pico for HID**
- Refer to the documentation [here](https://github.com/dbisu/pico-ducky) for detailed instructions on setting up the Raspberry Pi Pico for Human Interface Device (HiD) emulation.

**Step 2: Download SSHDucky ZIP**
- Download the SSHDucky ZIP file from [link to the ZIP file].

**Note: Understanding SSH Public Key Authentication**
Before using SSHDucky, it is important to have a clear understanding of SSH public key authentication and its working functionality. Familiarize yourself with this concept to ensure proper usage and security.

**Step 3: Extract the ZIP File**
- Extract the contents of the downloaded SSHDucky ZIP file to a suitable location on your computer.

**Step 4: Copy Files to Raspberry Pi Pico**
- Copy the extracted files to the root directory of your Raspberry Pi Pico's CIRCUITPY drive.

**Step 5: Update Email Address**
- Update the get_info.ps1 file and enter your mail id and app passowrd and save it.

**Step 6: Generate Key Pairs**
- Generate SSH key pairs on your machine using a tool of your choice.
- Copy the content of the public key to the `authorized_keys` file on the Raspberry Pi Pico.

**Step 7: Configure Payload**
- Open the `payload.dd` file located in `SSHDucky/rubber ducky` and configure it as needed.

**Step 8: Upload Payload to Raspberry Pi Pico**
- Copy the content of the `payload.dd` file and paste it into the payload file of the Raspberry Pi Pico.

**Step 9: Ready to Use**
- Your SSHDucky setup is now complete and ready to be used.

Enjoy using SSHDucky, but remember to use it responsibly and ethically.
