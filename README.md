# The Witchcraft Compiler Collection Environment

Dockerfile that builds a shell to run the wcc tool.

```bash
$ ./start.sh
```

## Witchcraft Compiler

https://github.com/endrazine/wcc

## Invoke Shared Libraries Usage

A tool which can be used to interactively call functions in shared libraries: the "Witchcraft Compiler Collection". https://github.com/endrazine/wcc

From the GitHub page:

wsh : The Witchcraft shell

The witchcraft shell accepts ELF shared libraries, ELF ET_DYN executables and Witchcraft Shell Scripts written in Punk-C as an input. It loads all the executables in its own address space and makes their API available for programming in its embedded interpreter. This provides for binaries functionalities similar to those provided via reflection on languages like Java.

Example usage of wsh The following command loads the  /usr/sbin/apache2 executable within wsh, calls the ap_get_server_banner() function within apache to retrieve its banner and displays it within the wsh interpreter.

```bash
jonathan@blackbox:~$ wsh /usr/sbin/apache2
> a = ap_get_server_banner()
> print(a)
Apache/2.4.7
```

