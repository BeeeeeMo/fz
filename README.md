
# fz (Fluent-bit+Zeek)
A quick and efficient way to set up a Zeek+Fluent-bit environment.

## Features

- Automatic removal of Zeek logs based on the specified number of days
- Easy configuration options for the project settings

## Usage
To use this Project, follow the steps below.

1. Create a file named `.env` in the root directory of the project.
2. In the `.env` file, add the following optional varible(s):
    - REMOVE_DAYS: number of days for which date will be kept (default: 7)
    - IFNAME: name of the network interface to be used (default: eth0)

Here is an example of how the `.env` file should look like:

```bash
REMOVE_DAYS=7
IFNAME=br1
```

#### Zeek configuration
If you have a custom `local.zeek` file, please place it in the `zeek/local.zeek` directory.

#### Fluent-bit
The configuration settings for Fluent-bit can be found in the file `fluent-bit/fluent-bit.conf`

#### Build and run
To build all the Docker iamges required for this project, run the following command:

```bash
docker-compose build
```

Run!
```bash
docker-compose up -d
```