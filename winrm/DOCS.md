# Home Assistant Add-on: Windows Remote Management (WinRM)

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Find the "Windows Remote Management (WinRM)" add-on and click it.
3. Click on the "INSTALL" button.

## Configuration

Add-on configuration:

```yaml
computers:
  - alias: test-pc-1
    address: test-pc-1.local
    username: user
    password: password
    transport: ntlm
    command: shutdown -h
  - alias: test-pc-2
    address: test-pc-2.local
    username: user
    password: password
    transport: ntlm
    command: shutdown -h
```

### Option: `computers` (required)

A list of computer to be able to connect over WinRM.

### Option: `computers.alias` (required)

Set an alias for this record, which becomes the name for the input.

### Option: `computers.address` (required)

WinRM endpoint.

NOTE: The addon will try and guess the correct endpoint url from the following formats:

* windows-host -> http://windows-host:5985/wsman
* windows-host:1111 -> http://windows-host:1111/wsman
* http://windows-host -> http://windows-host:5985/wsman
* http://windows-host:1111 -> http://windows-host:1111/wsman
* http://windows-host:1111/wsman -> http://windows-host:1111/wsman

### Option:  `computers.username` (required)

Username for logging into the computer. For domain users, enter `DOMAIN\Username`.

To grant non-admin users access to WinRM, run the following command on the remote computer. Then, add the user you want to grant access with Full Control.

```bash
winrm configsddl default
```

### Option:  `computers.password` (required)

Password for logging into the computer.

### Option:  `computers.transport` (optional)

Transport protocol to be used with WinRM.

#### Valid Options

* basic: Basic auth only works for local Windows accounts not domain accounts. Credentials are base64 encoded when sending to the server.
* plaintext: Same as basic auth.
* ntlm: Will use NTLM authentication for both domain and local accounts.

The default is `ntlm`. Certificate, Kerberos, and CredSSP are not supported.

## Home Assistant configuration

Use the following inside Home Assistant service call to use it:

```yaml
service: hassio.addon_stdin
data:
  addon: core_winrm
  input: test-pc
```

Each line explained:

`service: hassio.addon_stdin`: Use hassio.addon_stdin service to send data over STDIN to an add-on.
`data.addon: core_winrm`: Tells the service to send the command to this add-on.
`data.input: test-pc`: Alias name created for the computer in the add-on configuration.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository