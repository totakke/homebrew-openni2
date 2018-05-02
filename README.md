# homebrew-openni2

homebrew-openni2 is a project for installing [OpenNI2][openni2] related modules with [Homebrew][homebrew]: [OpenNI2-FreenectDriver][openni2-freenectdriver] for Kinect for Xbox360.

If you want to use OpenNI (not 2), refer to [homebrew-openni][homebrew-openni].

## NOTICE

OpenNI2 formula is now provided by [brewsci/science](https://github.com/brewsci/homebrew-science), so homebrew-openni2 won't provide it.
homebrew-openni2 is supporting OpenNI2-FreenectDriver formula.

## Version

* OpenNI2-FreenectDriver
    * 0.4.1

## Usage

### 1. Download formulae

First, tap homebrew-science and homebrew-openni2.

    $ brew tap brewsci/science
    $ brew tap totakke/openni2

### 2. Install

Install OpenNI2 by the following command.

    $ brew install openni2

If you want to use Kinect for Xbox360, install `openni2-freenectdriver` additionally.
It must be installed after installation of OpenNI2 is finished.

    $ brew install openni2-freenectdriver

Add the recommended variables to your dotfile (`.bash_profile`, `.zprofile`, etc.).

    export OPENNI2_INCLUDE=/usr/local/include/ni2
    export OPENNI2_REDIST=/usr/local/lib/ni2

Above paths are for default environment.
Check correct paths for your environment by `brew info openni2`.

### 3. Run NiViewer for test

Connect a device to the PC and run NiViewer.

    $ cd `brew --prefix`/share/openni2/tools
    $ ./NiViewer

### 4. Uninstall

    $ brew uninstall openni2

## License

Code is under the [BSD 2 Clause (NetBSD) license][license], the same as Homebrew.

[openni2]:http://structure.io/openni
[homebrew]:http://mxcl.github.com/homebrew/
[openni2-freenectdriver]:https://github.com/OpenKinect/libfreenect
[homebrew-openni]:https://github.com/totakke/homebrew-openni
[license]:https://github.com/totakke/homebrew-openni2/blob/master/LICENSE
