# Supported tags and respective `Dockerfile` links

-	[`latest` (*Dockerfile*)](https://github.com/arturluizbr/docker-namecoin/blob/master/Dockerfile)

# What is Namecoin?

Namecoin is a decentralized open source information registration and transfer system based on the Bitcoin cryptocurrency. Namecoin was the first fork of Bitcoin and still is one of the most innovative altcoins. It was first to implement merged mining and a decentralized DNS.

Find more information in the [Namecoin wiki](https://wiki.namecoin.info/) or join us on the [Namecoin forum](https://forum.namecoin.info/).

# How to use this image

## Start a `namecoin` server instance

Starting a Namecoin instance is simple:

	docker run --name some-namecoin -d arturluizbr/namecoin:tag

... where `some-namecoin` is the name you want to assign to your container and `tag` is the tag specifying the Namecoin version you want. See the list above for relevant tags.

# Caveats

## Where to Store Data

Important note: There are several ways to store data used by applications that run in Docker containers. We encourage users of the `namecoin` images to familiarize themselves with the options available, including:

-	Let Docker manage the storage of your database data [by writing the database files to disk on the host system using its own internal volume management](https://docs.docker.com/userguide/dockervolumes/#adding-a-data-volume). This is the default and is easy and fairly transparent to the user. The downside is that the files may be hard to locate for tools and applications that run directly on the host system, i.e. outside containers.
-	Create a data directory on the host system (outside the container) and [mount this to a directory visible from inside the container](https://docs.docker.com/userguide/dockervolumes/#mount-a-host-directory-as-a-data-volume). This places the database files in a known location on the host system, and makes it easy for tools and applications on the host system to access the files. The downside is that the user needs to make sure that the directory exists, and that e.g. directory permissions and other security mechanisms on the host system are set up correctly.

The Docker documentation is a good starting point for understanding the different storage options and variations, and there are multiple blogs and forum postings that discuss and give advice in this area. We will simply show the basic procedure here for the latter option above:

1.	Create a data directory on a suitable volume on your host system, e.g. `/my/own/datadir`.
2.	Start your `namecoin` container like this:

	docker run --name some-namecoin -v /my/own/datadir:/data -d arturluizbr/namecoin:tag

The `-v /my/own/datadir:/data` part of the command mounts the `/my/own/datadir` directory from the underlying host system as `/data` inside the container, where Namecoin will write its data files.

Note that users on host systems with SELinux enabled may see issues with this. The current workaround is to assign the relevant SELinux policy type to the new data directory so that the container will be allowed to access it:

	chcon -Rt svirt_sandbox_file_t /my/own/datadir

# Supported Docker versions

This image is officially supported on Docker version 1.5.0.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/arturluizbr/docker-namecoin/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/arturluizbr/docker-namecoin/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
