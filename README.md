# denorc

Define Deno version for each workspace so that it can be switched.

## Generate

The following command generates the latest version of `.denorc` in current directory.

```
$ curl -fsSL https://raw.githubusercontent.com/chibat/denorc/main/generate.sh | sh
```

The following command generates the specified version of `.denorc` in current directory.

```
$ curl -fsSL https://raw.githubusercontent.com/chibat/denorc/main/generate.sh | sh -s v1.8.0
```

## Usage

```
$ . .denorc
$ code . # or vi .
```

