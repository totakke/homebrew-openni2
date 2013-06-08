# homebrew-openni2

homebrew-openni2 is a project for installing [OpenNI2](http://openni.org/) with [Homebrew](http://mxcl.github.com/homebrew/).

If you want to use OpenNI (not 2), refer to [homebrew-openni](https://github.com/totakke/homebrew-openni).

## Version

* OpenNI2
    * 2.1-Beta

## Usage

### 1. Download formula

    $ brew tap totakke/openni2

### 2. Install

    $ brew install openni2

### 3. Run NiViewer for test

Connect a device to the PC and run NiViewer.

    $ cd `brew --cellar openni2`/2.1-Beta/tools
    $ ./NiViewer

### 4. Uninstall

    $ brew uninstall openni2

## License

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.

You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and limitations under the License.
