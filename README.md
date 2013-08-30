# homebrew-openni2

homebrew-openni2 is a project for installing [OpenNI2][openni2] with [Homebrew][homebrew].
This project additionally includes a formula of [OpenNI2-FreenectDriver][openni2-freenectdriver] for Kinect for Xbox360.

If you want to use OpenNI (not 2), refer to [homebrew-openni][homebrew-openni].

## Version

* OpenNI2
    * 2.2.0.30
* OpenNI2-FreenectDriver
    * c1458aebf1

## Usage

### 1. Download formula

    $ brew tap totakke/openni2

### 2. Install

    $ brew install openni2

If you want to use Kinect for Xbox360, install `openni2-freenectdriver` additionally.

    $ brew install openni2-freenectdriver


### 3. Run NiViewer for test

Connect a device to the PC and run NiViewer.

    $ cd `brew --cellar openni2`/2.2.0.30/tools
    $ ./NiViewer

### 4. Uninstall

    $ brew uninstall openni2

## License

Code is under the [BSD 2 Clause (NetBSD) license][license], the same as Homebrew.

[openni2]:http://openni.org/
[homebrew]:http://mxcl.github.com/homebrew/
[openni2-freenectdriver]:https://github.com/piedar/OpenNI2-FreenectDriver
[homebrew-openni]:https://github.com/totakke/homebrew-openni
[license]:https://github.com/totakke/homebrew-openni2/blob/master/LICENSE
