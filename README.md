# Module builder

An easy way to **build modules for the [Fedora Modularity](https://fedoraproject.org/wiki/Modularity) project**.

This is an OCI container image with the [Module Build Service](https://pagure.io/fm-orchestrator) and all its dependencies installed - so you don't have to install everything on your system. The container needs to run with `--cap-add=SYS_ADMIN` so it can use chroot your machine to build the module in Mock.

It supports the latest (v1.0) [modulemd](https://pagure.io/modulemd) specification.

## Usage

```
$ ./build_module /module/git/repo /results/directory
```

Please make sure that the name of your module repository and the modulemd file matches the name of your module.

### Example

Try this with an example module:

```
$ git clone https://github.com/asamalik/fake-proftpd-module-image proftpd
$ ./build_module ./proftpd ./results
```

### SELinux notes

If SELinux is enabled, the script instructs docker to (re)label the two bind-mounted directories in order that they are accessible from within the container. Take extra care not to specify directories you don't want relabeled here.

Unfortunately, all is not yet well with SELinux and running mock inside docker. If SELinux is set to enforcing, you'll likely get an AVC denial error like this:

```
SELinux is preventing mock from create access on the blk_file loop0.


*****  Plugin catchall (100. confidence) suggests   **************************

If you believe that mock should be allowed create access on the loop0 blk_file by default.
Then you should report this as a bug.
You can generate a local policy module to allow this access.
Do
allow this access for now by executing:
# ausearch -c 'mock' --raw | audit2allow -M my-mock
# semodule -X 300 -i my-mock.pp

...

```

While we work on a fix for this issue, please set SELinux to permissive mode by executing `setenforce 0` before running the script. Don't forget changing it back after you're done: `setenforce 1`

## Requirements

You need to have Docker running on your system. [Learn about Docker on Fedora](https://developer.fedoraproject.org/tools/docker/about.html).
