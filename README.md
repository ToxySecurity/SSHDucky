# Project Title: SSHDucky - Raspberry Pi Pico USB Rubber Ducky

## Project Abstract
SSHDucky is a project that utilizes the Raspberry Pi Pico microcontroller to create a USB Rubber Ducky device. This device emulates a keyboard and provides a quick SSH connection to an attacker's machine within just 30 seconds.

## Installation

Follow the steps below to set up the SSHDucky project:

**Step 1: Setup the Pi Pico for HiD**
- Refer to the documentation [here](https://github.com/dbisu/pico-ducky) for detailed instructions on setting up the Raspberry Pi Pico for Human Interface Device (HiD) emulation.

**Step 2: Download SSHDucky ZIP**
- Download the SSHDucky ZIP file from the project repository.

**Step 3: Extract and Copy to CIRCUITPY**
- Extract the contents of the ZIP file.
- Copy the extracted files to the root directory of the CIRCUITPY drive on your Raspberry Pi Pico.

**Step 4: Generate Key Pairs**
- Generate a pair of SSH key files (public and private keys) on your own machine.
- Copy the content of the public key file and add it to the `authorized_keys` file on the target machine.

**Step 5: Copy Payload to Raspberry Pi Pico**
- Locate the `payload.dd` file in the path `SSHDucky/rubber ducky/payload.dd`.
- Copy the contents of `payload.dd` to the payload file on your Raspberry Pi Pico.

**Step 6: Ready to Use**
- The SSHDucky project is now ready to use. Connect the Raspberry Pi Pico to the target machine, and it will emulate a USB Rubber Ducky, establishing an SSH connection to the attacker's machine.

Note: Please exercise caution and ensure that you are using this project for ethical purposes and in compliance with all applicable laws and regulations.
