Android Studio for Ubuntu/Debian
=====================

Android Studio by Google packaged for Ubuntu/Debian

Visit the official website [here](https://althafvly.github.io/android-studio)

Based upon the work of @PaoloRotolo

## How-to

#### Install via GitHub Repository (Debian/Ubuntu)
You can add this repository to your system to receive automatic updates:
```bash
echo "deb [trusted=yes] https://althafvly.github.io/android-studio/ ./" | sudo tee /etc/apt/sources.list.d/android-studio.list
sudo apt update
sudo apt install android-studio
```
Note: This repository is automatically updated every 7 days via GitHub Actions.

#### Install via PPA (Ubuntu only)
Download pre-built packages from our [PPA](https://launchpad.net/~maarten-fonville/+archive/ubuntu/android-studio)

#### Build android-studio (Ubuntu/Debian)
1. Install the build dependencies:
   ```bash
   sudo apt install git build-essential devscripts fakeroot dh-make python3 wget python3-bs4 python3-requests python3-lxml
   ```

2. Run configure with the parameters for the package you want to build:
   ```bash
   ./android-studio-configure.py (jammy|noble|plucky|questing|bullseye|bookworm|trixie) [--stable] [--metapackage] [--major 3.6]
   ```
   E.g. to build the latest stable version of Android Studio for Ubuntu noble:
   ```bash
   ./android-studio-configure.py noble --stable --metapackage
   ```

3. Build the package:
   ```bash
   cd android-studio
   debuild -us -uc -b
   ```

4. Install the generated package:
   ```bash
   sudo apt install ../android-studio*.deb
   ```

To clean the environment after configuration:
```bash
./android-studio-configure.py clean
```

## FAQ

##### Unable to start
**Q:** *When I click on the icon, Android Studio just doesn't start.*

**A:** Did you install Java? Try to install [Java Development Kit](https://packages.ubuntu.com/default-jdk) with `sudo apt install default-jdk`.

Also, try:
```
/opt/android-studio/bin/studio.sh
```
If you have this error, you probably have to install the **jdk**:
```
Start Failed: Internal error. Please report to https://code.google.com/p/android/issues

java.lang.NoClassDefFoundError: com.intellij.util.lang.ClassPath
at java.lang.Class.initializeClass(libgcj.so.14)
[...]
```
