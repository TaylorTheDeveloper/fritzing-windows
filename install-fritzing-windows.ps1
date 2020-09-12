# Install QT Manually from


# Configuration 
$qtFn = "qt-unified-windows-x86-online.exe"
$boostVersion = "1_74_0"
$boostZipFn = "boost_$boostVersion.zip"
$cmakeVersion = "3.18.2"
$cmakeMsiFn = "cmake-$cmakeVersion-win64-x64.msi"
$libgitVersion = "0.28.5"
$libgitZipFn ="libgit2-$libgitVersion.zip"
$libgitDn ="libgit2-$libgitVersion"
$libgitDnNoVer ="libgit2"

# Non-Interactive Script
mkdir fritzing 
cd fritzing

git clone https://github.com/fritzing/fritzing-app

git clone https://github.com/fritzing/fritzing-parts

wget "https://dl.bintray.com/boostorg/release/1.74.0/source/$boostZipFn" -O $boostZipFn
Expand-Archive -LiteralPath ".\$boostZipFn" -DestinationPath ".\" -Force

wget "https://github.com/libgit2/libgit2/releases/download/v0.28.5/$libgitZipFn" -O $libgitZipFn
Expand-Archive -LiteralPath ".\$libgitZipFn" -DestinationPath ".\" -Force
Rename-Item $libgitDn $libgitDnNoVer

wget "http://download.qt.io/official_releases/online_installers/$qtFn" -O $qtFn

wget "https://github.com/Kitware/CMake/releases/download/v3.18.2/$cmakeMsiFn" -O $cmakeMsiFn

# Cleanup
rm $boostZipFn
rm $libgitZipFn

# User Input Required
#.\$qtFn
#.\$cmakeMsiFn

$confirmation = Read-Host "QT and CMake have been downloaded in this dictory. Please install these via the installers and ensure CMAKE is in your system PATH before you continue. (enter y if installs are complete) :"
if ($confirmation -eq 'y') {
	rm $qtFn
	rm $cmakeMsiFn
    # proceed with final steps
	$confirmation2 = Read-Host "Please run .\buildlibgit.ps1 in a new powershell instance. :"
	if ($confirmation2 -eq 'y') {
	    # proceed with final steps
	    powershell buildlibgit.ps1
	    cd ..
	}
}


# Next open QT Creator, go ahead and open fritzing-app/phoenix.pro located in the fritzing-app directory. 
# If everything is configured correctly you should see some messages that state that libgit2 and boost have been found.